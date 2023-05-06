import { useEffect, useState, useRef } from 'react';

import { View, Text, Image } from 'react-native';

import {
	useGetUserQuery,
	useGetRadiusPushNotificationQuery,
} from '../services/api';

import * as Location from 'expo-location';

import * as Notifications from 'expo-notifications';

import { registerForPushNotificationsAsync } from '../pushNotifications';

import { fetchPushToken } from '../pushNotifications/usePushToken';

import { MainLayout } from '../components/layout/MainLayout';

import dashboard from '../styles/dashboardStyles';
import { defaults, PrimaryButton } from '../styles/frontendStyles.js';

import TrailFundsLogo from '../assets/images/TrailFundsLogo.png';

// const BACKGROUND_NOTIFICATION_TASK = 'BACKGROUND-NOTIFICATION-TASK';

// TaskManager.defineTask(
// 	BACKGROUND_NOTIFICATION_TASK,
// 	({ data, error, executionInfo }) => {
// 		console.log('Received a notification in the background!');
// 		// Do something with the notification data
// 	},
// );

// Notifications.registerTaskAsync(BACKGROUND_NOTIFICATION_TASK);

export const Dashboard = ({ navigation }) => {
	const [initialLocation, setInitialLocation] = useState({});

	const [notification, setNotification] = useState(false);

	const notificationListener = useRef();
	const responseListener = useRef();

	const { data, error, isLoading } = useGetUserQuery({
		refetchOnMountOrArgChange: true,
	});

	const {
		data: notificationData,
		isLoading: isLoadingNotification,
		error: isNotificationError,
	} = useGetRadiusPushNotificationQuery(
		{
			lat: initialLocation.latitude,
			lon: initialLocation.longitude,
			radius: 1500,
			message: 'this is a test message',
			token: fetchPushToken(),
		},
		{
			skip: !initialLocation.latitude || !fetchPushToken(),
			refetchOnMountOrArgChange: true,
			pollingInterval: 10000,
		},
	);

	if (notification) {
		console.log('***notification***: ', notification);
		console.log('***data***: ', notification.request?.content?.data);
	}

	useEffect(() => {
		(async () => {
			await registerForPushNotificationsAsync();

			notificationListener.current =
				Notifications.addNotificationReceivedListener((notification) => {
					setNotification(notification);
				});

			responseListener.current =
				Notifications.addNotificationResponseReceivedListener((response) => {
					console.log('***RESPONSE***: ', response);
					console.log('***CONTENT***: ', response.notification.request.content);
					console.log(
						'***DATA***: ',
						response.notification.request.content.data.id,
					);
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
			try {
				const { status } = await Location.requestForegroundPermissionsAsync();
				if (status !== 'granted') return;
			} catch (error) {
				console.error(error);
			}
			try {
				const { coords } = await Location.getCurrentPositionAsync({
					accuracy: 6,
				});
				const userRegion = {
					latitude: coords.latitude,
					longitude: coords.longitude,
					latitudeDelta: 0.1,
					longitudeDelta: 0.1,
				};
				setInitialLocation(userRegion);
			} catch (error) {
				console.error(error);
			}
		})();
	}, []);

	if (!isLoadingNotification) {
		// consoe.log('***notificationData***: ', notificationData);
	}

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
		data.isNew
			? `Welcome ${data.firstName}!`
			: `Welcome back, ${data.firstName}!`;

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
