//For the love of all that is holy do not put anything above this first import!
import 'react-native-gesture-handler';
//Put imports below this. Please and thank you.

import 'expo-dev-client';

import { StripeProvider } from '@stripe/stripe-react-native';

import React, { useEffect, useState, useRef } from 'react';

import { StackHome } from './routeNavigation/stack'; //Importing the main stack of pages for the app

import { Provider } from 'react-redux';
import { store } from './reduxStore';

import * as Notifications from 'expo-notifications';

import { setPushToken } from './pushNotifications/usePushToken';

import { registerForPushNotificationsAsync } from './pushNotifications';

export default function App() {
	const [notification, setNotification] = useState(false);

	console.log('***notification***: ', notification);

	const notificationListener = useRef();
	const responseListener = useRef();

	useEffect(() => {
		registerForPushNotificationsAsync().then((token) => setPushToken(token));

		notificationListener.current =
			Notifications.addNotificationReceivedListener((notification) => {
				setNotification(notification);
			});

		responseListener.current =
			Notifications.addNotificationResponseReceivedListener((response) => {
				console.log('***RESPONSE***: ', response);
			});

		return () => {
			Notifications.removeNotificationSubscription(
				notificationListener.current,
			);
			Notifications.removeNotificationSubscription(responseListener.current);
		};
	}, []);

	return (
		<StripeProvider
			merchantIdentifier='merchant.com.trailfunds'
			publishableKey='pk_test_6lirKvgneglhHRWZKJLFrCub00czNZvHDi'
		>
			<Provider store={store}>
				<StackHome />
			</Provider>
		</StripeProvider>
	);
}
