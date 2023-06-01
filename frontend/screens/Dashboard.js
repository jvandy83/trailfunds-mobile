import { useEffect, useCallback, useRef } from 'react';

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

import { setLocation } from '../reduxStore/features/location/locationSlice';

import { useNavigation } from '@react-navigation/native';

import dashboard from '../styles/dashboardStyles';
import { defaults, PrimaryButton } from '../styles/frontendStyles.js';

import TrailFundsLogo from '../assets/images/TrailFundsLogo.png';

const NOTIFICATION_TASK_NAME = 'BACKGROUND-NOTIFICATION-TASK';
const LOCATION_TASK_NAME = 'BACKGROUND-LOCATION-TASK';

export const Dashboard = () => {
	const navigation = useNavigation();

	const notificationListener = useRef();
	const responseListener = useRef();

	const { location } = useSelector((state) => state.location);

	const dispatch = useDispatch();

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
		},
	);

	const { data: userData, error, isLoading } = useGetUserQuery();

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
		},
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
				console.log('***locations***: ', locations);
				console.log('***executionInfo***: ', executionInfo);
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
		},
	);

	// request permission to send notifications
	useEffect(() => {
		(async () => {
			await registerForPushNotificationsAsync();

			// notification recieved
			notificationListener.current =
				Notifications.addNotificationReceivedListener((notification) => {
					console.log(
						'***notification.data in notification listener***: ',
						notification.request.content.data,
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
				dispatch(setLocation(userRegion));
				await Location.startLocationUpdatesAsync(LOCATION_TASK_NAME, {
					accuracy: Location.Accuracy.Balanced,
					// timeInterval: 10000,
					distanceInterval: 20,
				});
				// const { status: backgroundStatus } =
				// 	await Location.requestBackgroundPermissionsAsync();
				// if (backgroundStatus === 'granted') {
				// 	await Location.startLocationUpdatesAsync(LOCATION_TASK_NAME, {
				// 		accuracy: Location.Accuracy.Balanced,
				// 		// timeInterval: 10000,
				// 		distanceInterval: 20,
				// 	});
				// 	console.log('Background permission is granted');
				// }
			}
		})();
	}, []);

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

	Notifications.registerTaskAsync(NOTIFICATION_TASK_NAME);

	return (
		<View>
			<MainLayout styleProp={defaults.background}>
				<View style={dashboard.welcomeContainer}>
					<Text style={dashboard.trailFunds}>Trail Funds</Text>
					<Image source={TrailFundsLogo} style={dashboard.logo} />
					<Text style={dashboard.welcomeMessage}>
						{userData.isNew
							? `Welcome ${userData.firstName}!`
							: `Welcome back, ${userData.firstName}!`}
					</Text>
				</View>
				<PrimaryButton
					text='View Profile'
					color='white'
					onPress={() => navigation.navigate('Profile')}
				/>
				<PrimaryButton
					text='My Wallet'
					color='white'
					onPress={() => navigation.navigate('Wallet')}
				/>
				<PrimaryButton
					text='Recent Donations'
					color='white'
					//onPress={() => navigation.navigate("Donations")}
				/>
			</MainLayout>
		</View>
	);
};

/*

***NOTIFICATION PAYLOAD***

{
	"date": 1683236545.8257608, 
	"request": {
		"content": {
			"attachments": [], 
			"badge": null, 
			"body": "this is a test message", 
			"categoryIdentifier": "", 
			"data": {}, 
			"launchImageName": "", 
			"sound": null, 
			"subtitle": null, 
			"summaryArgument": null, 
			"summaryArgumentCount": 0, 
			"targetContentIdentifier": null, 
			"threadIdentifier": "", 
			"title": null
		}, 
		"identifier": "E6D71CC5-3899-4C46-AE9D-5A474CDA8EBD", 
		"trigger": {
			"class": "UNPushNotificationTrigger", 
			"payload": {
				"aps": {
					"alert": {
						"body": "this is a test message", 
						"launch-image": "", 
						"subtitle": "", 
						"title": ""
					}, 
					"category": "", 
					"thread-id": ""
				}, 
				"body": {}, 
				"experienceId": "@vanthedev/TrailFundsApp", 
				"projectId": "08397746-9845-4f6a-8f8b-575a44ae3772", 
				"scopeKey": "@vanthedev/TrailFundsApp"
			}, 
			"type": "push"
		}
	}
}

*/
