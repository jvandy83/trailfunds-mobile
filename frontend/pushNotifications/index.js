import { Platform } from 'react-native';
import * as Device from 'expo-device';
import * as Notifications from 'expo-notifications';

import { setPushToken } from './usePushToken';

Notifications.setNotificationHandler({
	handleNotification: async () => ({
		shouldShowAlert: true,
		shouldPlaySound: false,
		shouldSetBadge: false,
	}),
});

export const registerForPushNotificationsAsync = async () => {
	let token;

	if (Device.isDevice) {
		const { status: existingStatus } =
			await Notifications.getPermissionsAsync();

		console.log('***EXISTING_STATUS***: ', existingStatus);

		let finalStatus = existingStatus;

		if (existingStatus !== 'granted') {
			const { status } = await Notifications.requestPermissionsAsync();

			console.log('***STATUS***: ', status);

			finalStatus = status;
		}

		if (finalStatus !== 'granted') {
			alert('Failed to get push token for push notification!');

			return;
		}

		token = (await Notifications.getExpoPushTokenAsync()).data;

		// console.log('***token inside registerForPushNotificationAsync***: ', token);
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

	setPushToken(token);
};

export const requestPermissions = async () => {
	const { status: foregroundStatus } =
		await Location.requestForegroundPermissionsAsync();
	if (foregroundStatus === 'granted') {
		const { status: backgroundStatus } =
			await Location.requestBackgroundPermissionsAsync();
		if (backgroundStatus === 'granted') {
			await Location.startLocationUpdatesAsync(LOCATION_TASK_NAME, {
				accuracy: Location.Accuracy.Balanced,
			});
		}
	}
};
