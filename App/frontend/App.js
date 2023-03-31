//For the love of all that is holy do not put anything above this first import!
import 'react-native-gesture-handler';
//Put imports below this. Please and thank you.

import 'expo-dev-client';

import { StripeProvider } from '@stripe/stripe-react-native';

import React from 'react';
import { NavigationContainer } from '@react-navigation/native'; //Allows for navigation in the app
import { StackHome } from './routes/stack'; //Importing the main stack of pages for the app

export default function App() {
	return (
		<StripeProvider
			merchantIdentifier='merchant.com.trailfunds'
			publishableKey='pk_test_6lirKvgneglhHRWZKJLFrCub00czNZvHDi'
		>
			<NavigationContainer>
				<StackHome />
			</NavigationContainer>
		</StripeProvider>
	);
}
