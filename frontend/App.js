//For the love of all that is holy do not put anything above this first import!
import 'react-native-gesture-handler';
//Put imports below this. Please and thank you.

import 'expo-dev-client';

import { StripeProvider } from '@stripe/stripe-react-native';

import React from 'react';

import { StackHome } from './routeNavigation/stack'; //Importing the main stack of pages for the app

import { Provider } from 'react-redux';
import { store } from './reduxStore';

export default function App() {
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

