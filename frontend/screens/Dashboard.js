import { useEffect, useState, useRef } from 'react';

import { View, Text, Image } from 'react-native';

import {
	useGetUserQuery,
	useGetRadiusPushNotificationQuery,
} from '../services/api';

import { useSelector, useDispatch } from 'react-redux';

import * as Location from 'expo-location';

import * as TaskManager from 'expo-task-manager';

import * as Notifications from 'expo-notifications';

import { registerForPushNotificationsAsync } from '../api/pushNotifications';

import { fetchPushToken } from '../api/pushNotifications/usePushToken';

import { MainLayout } from '../components/layout/MainLayout';

import {
	setLocation,
	setInitialLocation,
} from '../reduxStore/features/location/locationSlice';

import dashboard from '../styles/dashboardStyles';
import { defaults, PrimaryButton } from '../styles/frontendStyles.js';

import TrailFundsLogo from '../assets/images/TrailFundsLogo.png';

const LOCATION_TASK_NAME = 'BACKGROUND-LOCATION-TASK';
const NOTIFICATION_TASK_NAME = 'BACKGROUND-NOTIFICATION-TASK';

export const Dashboard = ({ navigation }) => {
	const [notification, setNotification] = useState(false);

	const notificationListener = useRef();
	const responseListener = useRef();

	const { initialLocation, location } = useSelector((state) => state.location);

	const dispatch = useDispatch();

	const {
		data: userData,
		error,
		isLoading,
	} = useGetUserQuery({
		refetchOnMountOrArgChange: true,
	});

	const {
		data: notificationData,
		isLoading: isLoadingNotification,
		error: isNotificationError,
	} = useGetRadiusPushNotificationQuery(
		{
			lat: location.latitude,
			lon: location.longitude,
			radius: 20,
			message: 'this is a test message',
			token: fetchPushToken(),
		},
		{
			skip: !location.latitude || !fetchPushToken(),
			refetchOnMountOrArgChange: true,
			pollingInterval: 10000,
		},
	);

	// request permission to send notifications
	useEffect(() => {
		(async () => {
			await registerForPushNotificationsAsync();

			notificationListener.current =
				Notifications.addNotificationReceivedListener((notification) => {
					setNotification(notification);
				});

			responseListener.current =
				Notifications.addNotificationResponseReceivedListener((response) => {
					const trailId = response.notification.request.content.data.id;
					navigation.navigate('Trail', { trailId });
				});

			return () => {
				Notifications.removeNotificationSubscription(
					notificationListener.current,
				);
				Notifications.removeNotificationSubscription(responseListener.current);
			};
		})();
	}, []);

	useEffect(() => {
		(async () => {
			const { status: foregroundStatus } =
				await Location.requestForegroundPermissionsAsync();
			if (foregroundStatus === 'granted') {
				const { coords } = await Location.getCurrentPositionAsync();
				const userRegion = {
					latitude: coords.latitude,
					longitude: coords.longitude,
					latitudeDelta: 0.1,
					longitudeDelta: 0.1,
				};
				dispatch(setInitialLocation(userRegion));
				dispatch(setLocation(userRegion));
				const { status: backgroundStatus } =
					await Location.requestBackgroundPermissionsAsync();
				if (backgroundStatus === 'granted') {
					await Location.startLocationUpdatesAsync(LOCATION_TASK_NAME, {
						accuracy: Location.Accuracy.Balanced,
					});
				}
			}
		})();
	}, []);

	TaskManager.defineTask(
		NOTIFICATION_TASK_NAME,
		({ data, error, executionInfo }) => {
			if (error) {
				// Error occurred - check `error.message` for more details.
				return;
			}
			if (data) {
				// do something with the locations captured in the background
				console.log(data);
			}
		},
	);

	TaskManager.defineTask(
		LOCATION_TASK_NAME,
		({ data, error, executionInfo }) => {
			if (error) {
				// Error occurred - check `error.message` for more details.
				return;
			}
			if (data) {
				const { locations } = data;

				dispatch(setLocation(locations[0].coords));
				// do something with the locations captured in the background
			}
		},
	);

	Notifications.registerTaskAsync(NOTIFICATION_TASK_NAME);

	if (isLoading) {
		return (
			<View>
				<Text>Loading...</Text>
			</View>
		);
	}
	if (error) {
		console.error(error);
	}

	const greeting = () =>
		userData.isNew
			? `Welcome ${userData.firstName}!`
			: `Welcome back, ${userData.firstName}!`;

	return (
		<View>
			<MainLayout styleProp={defaults.background}>
				<View style={dashboard.welcomeContainer}>
					<Text style={dashboard.trailFunds}>Trail Funds</Text>
					<Image source={TrailFundsLogo} style={dashboard.logo} />
					<Text style={dashboard.welcomeMessage}>{greeting()}</Text>
				</View>
				<PrimaryButton
					text='View Profile'
					onPress={() => navigation.navigate('Profile')}
				/>
				<PrimaryButton
					text='My Wallet'
					onPress={() => navigation.navigate('Wallet')}
				/>
				<PrimaryButton
					text='Recent Donations'
					//onPress={() => navigation.navigate("Donations")}
				/>
			</MainLayout>
		</View>
	);
};
