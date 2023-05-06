//For the love of all that is holy do not put anything above this first import!
import 'react-native-gesture-handler';
//Put imports below this. Please and thank you.

import 'expo-dev-client';

import { StripeProvider } from '@stripe/stripe-react-native';

import React from 'react';

import { StackHome } from './routeNavigation/stack'; //Importing the main stack of pages for the app

import { Provider } from 'react-redux';
import { store } from './reduxStore';

import * as TaskManager from 'expo-task-manager';

import * as Notifications from 'expo-notifications';

export default function App() {
	const BACKGROUND_NOTIFICATION_TASK = 'BACKGROUND-NOTIFICATION-TASK';

	TaskManager.defineTask(
		BACKGROUND_NOTIFICATION_TASK,
		({ data, error, executionInfo }) => {
			console.log('Received a notification in the background!');
			// Do something with the notification data
		},
	);

	Notifications.registerTaskAsync(BACKGROUND_NOTIFICATION_TASK);

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
