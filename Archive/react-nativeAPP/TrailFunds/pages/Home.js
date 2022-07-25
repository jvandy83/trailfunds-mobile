//Text styles
import defaultSty from '../style/defaultSty';
//button styles
// import PrimaryButton from '../style/primeButt';
import HollowButton from '../style/hollowButt';
import GreenTextButt from '../style/greenTextButt';
import React, { useEffect, useState, useRef } from "react";
import { Alert, StyleSheet, Text, View, Button, Platform} from "react-native";
import * as TaskManager from "expo-task-manager";
import * as Location from "expo-location";
import PrimaryButton from "../style/primeButt";
import * as Device from 'expo-device';
import * as Notifications from 'expo-notifications';

const TrailData = require('../assets/TrailData'); 

const LOCATION_TASK_NAME = "LOCATION_TASK_NAME"
const GEOFENCE = "LOCATION_GEOFENCE"
let foregroundSubscription = null
let region = [
    {identifier:TrailData.features[0].properties.Name, 
    latitude: TrailData.features[0].geometry.coordinates[1], 
    longitude: TrailData.features[0].geometry.coordinates[0], 
    radius:1}]

// Define the background task for location tracking
TaskManager.defineTask(LOCATION_TASK_NAME, async ({ data, error }) => {
  if (error) {
    console.error(error)
    return
  }
  if (data) {
    // Extract location coordinates from data
    const { locations } = data
    const location = locations[0]
    if (location) {
    //   console.log("Location in background", location.coords)
    }
  }
})

Notifications.setNotificationHandler({
    handleNotification: async () => ({
      shouldShowAlert: true,
      shouldPlaySound: false,
      shouldSetBadge: false,
    }),
  });

export default function App({navigation}) {

    const notificationListener = useRef();
    const responseListener = useRef();
    const [expoPushToken, setExpoPushToken] = useState('');
    const [notification, setNotification] = useState(false);

TaskManager.defineTask(GEOFENCE, ({ data: { eventType, region }, error }) => {
    if (error) {
    // check `error.message` for more details.
      console.error(error)
      return
    }
    if (eventType === Location.GeofencingEventType.Enter) {
      Alert.alert('Entered region: ' + region.identifier)
      console.log("You've entered region:", region);
      sendPushNotification(expoPushToken, true);
    } else if (eventType === Location.GeofencingEventType.Exit) {
      Alert.alert('Left region: ' + region.identifier)
      console.log("You've left region:", region);
      sendPushNotification(expoPushToken, false);
    }
  });
    // Define position state: {latitude: number, longitude: number}
  const [position, setPosition] = useState(null)

  useEffect(() => {
    registerForPushNotificationsAsync().then(token => setExpoPushToken(token));

    // This listener is fired whenever a notification is received while the app is foregrounded
    notificationListener.current = Notifications.addNotificationReceivedListener(notification => {
      setNotification(notification);
    });

    // This listener is fired whenever a user taps on or interacts with a notification (works when app is foregrounded, backgrounded, or killed)
    responseListener.current = Notifications.addNotificationResponseReceivedListener(response => {
        console.log(response);
        // response.notification.request.content.body
        navigation.navigate('Notification', {
            trailName: response.notification.request.content.body, 
            trailData: response.notification.request.content.data
        });
    });

    return () => {
      Notifications.removeNotificationSubscription(notificationListener.current);
      Notifications.removeNotificationSubscription(responseListener.current);
    };
  }, []);

  // Request permissions right after starting the app
  useEffect(() => {
    const requestPermissions = async () => {
      const foreground = await Location.requestForegroundPermissionsAsync()
      if (foreground.granted) await Location.requestBackgroundPermissionsAsync()
    }
    requestPermissions()
  }, [])

  // Start location tracking in foreground
  const startForegroundUpdate = async () => {
    // Check if foreground permission is granted
    const { granted } = await Location.getForegroundPermissionsAsync()
    if (!granted) {
      console.log("location tracking denied")
      return
    }

    // Make sure that foreground location tracking is not running
    foregroundSubscription?.remove()

    // Start watching position in real-time
    foregroundSubscription = await Location.watchPositionAsync(
      {
        // For better logs, we set the accuracy to the most sensitive option
        accuracy: Location.Accuracy.BestForNavigation,
      },
      location => {
        setPosition(location.coords)
      }
    )
  }

  // Stop location tracking in foreground
  const stopForegroundUpdate = () => {
    foregroundSubscription?.remove()
    setPosition(null)
  }

  // Start location tracking in background
  const startBackgroundUpdate = async () => {
    // Don't track position if permission is not granted
    const { granted } = await Location.getBackgroundPermissionsAsync()
    if (!granted) {
      console.log("location tracking denied")
      return
    }

    // Make sure the task is defined otherwise do not start tracking
    const isTaskDefined = await TaskManager.isTaskDefined(LOCATION_TASK_NAME)
    if (!isTaskDefined) {
      console.log("Task is not defined")
      return
    }

    const isGeoTaskDefined = await TaskManager.isTaskDefined(GEOFENCE)
    if (!isGeoTaskDefined) {
      console.log("Task is not defined")
      return
    }
    // Don't track if it is already running in background
    const hasStarted = await Location.hasStartedLocationUpdatesAsync(
      LOCATION_TASK_NAME
    )
    if (hasStarted) {
      console.log("Already started")
      return
    }
    const hasStartedGeo = await Location.hasStartedGeofencingAsync(
        GEOFENCE
      )
      if (hasStartedGeo) {
        console.log("Already started")
        return
      }

    await Location.startLocationUpdatesAsync(LOCATION_TASK_NAME, {
      // For better logs, we set the accuracy to the most sensitive option
      accuracy: Location.Accuracy.BestForNavigation,
      // Make sure to enable this notification if you want to consistently track in the background
      showsBackgroundLocationIndicator: true,
      foregroundService: {
        notificationTitle: "Location",
        notificationBody: "Location tracking in background",
        notificationColor: "#fff",
      },
    })

    Location.startGeofencingAsync(GEOFENCE, [
        {identifier:"Escalante Hall", 
        latitude: 39.081311, 
        longitude: -108.55511, 
        radius:30}]);
  }

  // Stop location tracking in background
  const stopBackgroundUpdate = async () => {
    let hasStarted = await Location.hasStartedLocationUpdatesAsync(
      LOCATION_TASK_NAME
    )
    if (hasStarted) {
      await Location.stopLocationUpdatesAsync(LOCATION_TASK_NAME)
      console.log("Location tacking stopped")
    }
    hasStarted = await Location.hasStartedGeofencingAsync(
        GEOFENCE
      )
      if (hasStarted) {
        await Location.stopGeofencingAsync(GEOFENCE)
        console.log("Geofencing has stopped")
      }
  }

    navigateToScreen=()=>{
        navigation.navigate('Second')
    }
  return (
    <View style = {defaultSty.container}>
        <Text style={defaultSty.head1}>
            TrailFunds
        </Text>
        <PrimaryButton //This is our styled green button that will act as the donate button. This is calling the Style made in the 'defaultSty.js' file
            text = 'Sign Up'
            onPress={() => navigation.navigate('signUp')}
        />
        <PrimaryButton
            text= 'Donate'
            onPress={() => navigation.navigate('Donate')}
        />
        <HollowButton //just a test to see what the button would do.
            text = 'Map'
            onPress={() => navigation.navigate('GMap')}
        />
        <HollowButton //just a test to see what the button would do.
            text = 'Geofence'
            onPress={() => navigation.navigate('Geofence')}
        /> 
        <PrimaryButton 
            text = 'Landing Page'
            onPress={() => navigation.navigate('LandingPage')}
        />
        <GreenTextButt //This will be the default button and the OS of the system will make it there own
            text = "Contact Us"
            onPress={() => navigation.navigate('contact')}
        />
        <GreenTextButt //This will be the default button and the OS of the system will make it there own
            text = "Notification"
            onPress={() => navigation.navigate('Notification')}
        />
      {/* <Text>Longitude: {position?.longitude}</Text>
      <Text>Latitude: {position?.latitude}</Text> */}
      {/* <View style={styles.separator} />
      <Button
        onPress={startForegroundUpdate}
        title="Start in foreground"
        color="green"
      />
      <View style={styles.separator} />
      <PrimaryButton
        onPress={() => navigation.navigate('Donate2')}
        Text="Stop in foreground"
      />*/} 
        <View style={styles.separator} />
        <PrimaryButton
            onPress={startBackgroundUpdate}
            text="Start Geofencing"
        />
        <View style={styles.separator} />
        <PrimaryButton
            onPress={stopBackgroundUpdate}
            text="Stop Geofencing"
        />
    </View>
  )
}


async function sendPushNotification(expoPushToken, status) {
    let message = {
      to: expoPushToken,
      sound: 'default',
      title: 'Original Title',
      body: 'And here is the body!',
      data: { someData: 'goes here' },}
      
    if (status==true){
      message.title = 'Entered Geofence'
      message.body = region[0].identifier
    }
    else {
      message.title = 'Exited Geofence'
      message.body = region[0].identifier
    }
  
    await fetch('https://exp.host/--/api/v2/push/send', {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Accept-encoding': 'gzip, deflate',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(message),
    });
  }
  
  async function registerForPushNotificationsAsync() {
    let token;
    if (Device.isDevice) {
      const { status: existingStatus } = await Notifications.getPermissionsAsync();
      let finalStatus = existingStatus;
      if (existingStatus !== 'granted') {
        const { status } = await Notifications.requestPermissionsAsync();
        finalStatus = status;
      }
      if (finalStatus !== 'granted') {
        alert('Failed to get push token for push notification!');
        return;
      }
      token = (await Notifications.getExpoPushTokenAsync()).data;
      console.log(token);
    } else {
      alert('Must use physical device for Push Notifications');
    }
  
    if (Platform.OS === 'android') {
      Notifications.setNotificationChannelAsync('default', {
        name: 'default',
        importance: Notifications.AndroidImportance.MAX,
        vibrationPattern: [0, 250, 250, 250],
        lightColor: '#FF231F7C',
      });
    }
  
    return token;
  }

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
  switchContainer: {
    flexDirection: "row",
    alignItems: "center",
  },
  button: {
    marginTop: 15,
  },
  separator: {
    marginVertical: 8,
  },
})