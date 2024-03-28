import * as Sentry from "@sentry/react-native";

import { useEffect, useState, useRef } from "react";

import { View, Text, Dimensions } from "react-native";

import {
  useGetMeQuery,
  useGetRadiusPushNotificationQuery,
  useVerifyEmailMutation,
} from "../services/api";

import { useSelector, useDispatch } from "react-redux";

import { useAuth0 } from "react-native-auth0";

import * as Location from "expo-location";

import * as TaskManager from "expo-task-manager";

import * as Notifications from "expo-notifications";

import { registerForPushNotificationsAsync } from "../pushNotifications";

import { fetchPushToken } from "../pushNotifications/usePushToken";

import { sec } from "@hooks/useToken.js";

import { MainLayout } from "@components/layout/MainLayout";

import { setLocation } from "../reduxStore/features/location/locationSlice";

import { useNavigation } from "@react-navigation/native";

import {
  defaults,
  PrimaryButton,
} from "../reduxStore/styles/frontendStyles.js";

import { Icon } from "@components/icons";

import { ModalEmailVerification, NewUserFormModal } from "@components/modal";

const NOTIFICATION_TASK_NAME = "BACKGROUND-NOTIFICATION-TASK";
const LOCATION_TASK_NAME = "BACKGROUND-LOCATION-TASK";

export const Home = () => {
  const { width, height } = Dimensions.get("window");
  const { user, getCredentials, clearCredentials } = useAuth0();

  sec.setAccessToken(getCredentials);

  const navigation = useNavigation();

  const notificationListener = useRef();
  const responseListener = useRef();

  const { location } = useSelector((state) => state.location);

  const dispatch = useDispatch();

  const [emailVerified, setEmailVerified] = useState(true);

  const [showEmailVerificationModal, setShowEmailVerificationModal] =
    useState(true);

  const [showNewUserForm, setShowNewUserForm] = useState(true);
  const [userLoaded, setUserLoaded] = useState(false);

  const [
    verifyEmail,
    { isLoading: verifyEmailLoading, error: verifyEmailError },
  ] = useVerifyEmailMutation();

  const {
    data: notificationData,
    isLoading: isLoadingNotification,
    error: isNotificationError,
  } = useGetRadiusPushNotificationQuery(
    {
      lat: location.latitude,
      lon: location.longitude,
      radius: 20,
      token: fetchPushToken(),
    },
    {
      skip: !location.latitude || !fetchPushToken(),
    }
  );

  const { data: userData, error, isLoading } = useGetMeQuery();

  const fetchOrCreateUser = async () => {
    const { message, data } = userData;

    data && setShowNewUserForm(false);
  };

  const handleCheckEmailVerified = async () => {
    const response = await verifyEmail(user?.sub);
    // Once a user enters the app
    // after using Auth0 to sign up
    // a user will exist
    // but their email will not be verified
    const { message, data } = response.data;
    // Just in case user info gets cached on
    // device in test flight after installing new build
    // but they were removed from db
    // make sure and log the user out so app
    // doesn't hang
    if (message?.includes("The user does not exist")) {
      await clearCredentials();
      return;
    }
    setEmailVerified(data);
  };

  TaskManager.defineTask(
    NOTIFICATION_TASK_NAME,
    ({ data, error, executionInfo }) => {
      if (error) {
        // Error occurred - check `error.message` for more details.
        console.error(error.message);
        return;
      }
      if (data) {
        // do something with the locations captured in the background
        console.log(data);
      }
    }
  );

  TaskManager.defineTask(
    LOCATION_TASK_NAME,
    ({ data, error, executionInfo }) => {
      if (error) {
        console.error(error.message);
        // Error occurred - check `error.message` for more details.
        return;
      }
      if (data) {
        const { locations } = data;
        const coords = locations[0].coords;
        const userRegion = {
          latitude: coords.latitude,
          longitude: coords.longitude,
          latitudeDelta: 0.1,
          longitudeDelta: 0.1,
        };
        dispatch(setLocation(userRegion));
        // do something with the locations captured in the background
      }
    }
  );

  useEffect(() => {
    // request permission to send notifications
    (async () => {
      await registerForPushNotificationsAsync();

      // notification recieved
      notificationListener.current =
        Notifications.addNotificationReceivedListener((notification) => {
          console.log(
            "***notification.data in notification listener***: ",
            notification.request.content.data
          );
        });

      // notification recieved and with action performed
      responseListener.current =
        Notifications.addNotificationResponseReceivedListener((response) => {
          const trailId = response.notification.request.content.data.id;
          // eventually add ability to let user
          // set time offsets between notifications
          // with Notification Catgories
          // i.e "Dismiss notification for 24hrs, 1 week..."
          // const notificationTime = Date.now(response.notification.date);
          // setNotification(notification.request.content.data.id);
          navigation.navigate("Trail", { trailId });
        });

      return () => {
        Notifications.removeNotificationSubscription(
          notificationListener.current
        );
        Notifications.removeNotificationSubscription(responseListener.current);
      };
    })();
  }, []);

  useEffect(() => {
    (async () => {
      const { status: foregroundStatus } =
        await Location.requestForegroundPermissionsAsync();
      if (foregroundStatus === "granted") {
        const { coords } = await Location.getCurrentPositionAsync();
        const userRegion = {
          latitude: coords.latitude,
          longitude: coords.longitude,
          latitudeDelta: 0.1,
          longitudeDelta: 0.1,
        };
        dispatch(setLocation(userRegion));
        await Location.startLocationUpdatesAsync(LOCATION_TASK_NAME, {
          distanceInterval: 20,
          activityType: Location.LocationActivityType.Fitness,
        });
        const { status: backgroundStatus } =
          await Location.requestBackgroundPermissionsAsync();
        if (backgroundStatus === "granted") {
          await Location.startLocationUpdatesAsync(LOCATION_TASK_NAME, {
            distanceInterval: 20,
            activityType: Location.LocationActivityType.Fitness,
          });
        }
      }
    })();
  }, []);

  useEffect(() => {
    (async () => {
      await handleCheckEmailVerified();
      await fetchOrCreateUser();
    })();
  }, []);

  useEffect(() => {
    setShowEmailVerificationModal(!emailVerified);
  }, [emailVerified]);

  if (isLoading) {
    return (
      <View>
        <Text>Loading...</Text>
      </View>
    );
  }

  if (error) {
    console.error(JSON.stringify(error.data));
  }

  Notifications.registerTaskAsync(NOTIFICATION_TASK_NAME);

  return (
    <View>
      {showEmailVerificationModal && (
        <ModalEmailVerification
          title="Have you verified your email?"
          isVisible={showEmailVerificationModal}
          setIsModalVisible={setShowEmailVerificationModal}
          emailVerified={emailVerified}
          handleCheckEmailVerified={handleCheckEmailVerified}
        />
      )}
      {!showEmailVerificationModal && showNewUserForm && !userData?.data && (
        <NewUserFormModal
          title="Please enter your first and last name."
          isVisible={showNewUserForm}
          setIsModalVisible={setShowNewUserForm}
          setUserLoaded={setUserLoaded}
        />
      )}
      <MainLayout styleProp={defaults.background}>
        <View className="items-center justify-center pb-8">
          <Text className="font-primary-600 text-6xl py-4">Trail Funds</Text>
          <Icon icon="trailfundsLogo" size={100} />
          {userData?.data ? (
            <Text className="text-3xl pt-6">{`Welcome ${userData?.data.firstName}!`}</Text>
          ) : (
            <Text className="text-3xl pt-6">{`Welcome!`}</Text>
          )}
        </View>
        <PrimaryButton
          text="View Profile"
          color="white"
          onPress={() => navigation.navigate("Profile")}
        />
        <PrimaryButton
          text="My Wallet"
          color="white"
          onPress={() => navigation.navigate("Wallet")}
        />
        <PrimaryButton
          text="Recent Donations"
          color="white"
          //onPress={() => navigation.navigate("Donations")}
        />
      </MainLayout>
    </View>
  );
};
