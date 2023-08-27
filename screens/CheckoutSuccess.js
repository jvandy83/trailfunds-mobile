import React, { useEffect, useState } from 'react';

import { View, Text, Pressable } from 'react-native';

import { useNavigation } from '@react-navigation/native';

import * as Linking from 'expo-linking';

import { useCreatePortalSessionMutation } from '../services/api';

import { MainLayout } from '../components/layout';

export const CheckoutSuccess = ({ route }) => {
	const { sessionId } = route.params;

	const [url, setUrl] = useState('');
	const [processing, setProcessing] = useState(false);

	const { navigate } = useNavigation();

	const [createPortalSession, { isSuccess }] = useCreatePortalSessionMutation();

	const handleManageBillingClick = async () => {
		console.log('sessionId: ', sessionId);
		try {
			const { portal_session } = await createPortalSession(sessionId).unwrap();
			console.log(portal_session);
			setUrl(portal_session.url);
		} catch (error) {
			console.error(error);
		}
	};

	useEffect(() => {
		const getUrlAsync = async () => {
			// Get the deep link used to open the app
			// const initialUrl = await Linking.getInitialURL();
			let parsedInitialUrl = null;
			let initialUrl = null;
			try {
				parsedInitialUrl = await Linking.parseInitialURLAsync();
				initialUrl = await Linking.getInitialURL();
				console.log('***PARSED_URL*** ', parsedInitialUrl);
				console.log('***INITIAL_URL*** ', initialUrl);
			} catch (error) {
				console.error(error);
			}

			// The setTimeout is just for testing purpose
			setTimeout(() => {
				setUrl(initialUrl);
				setProcessing(false);
			}, 1000);
		};

		getUrlAsync();
	}, []);

	useEffect(() => {
		console.log('isSuccess: ', isSuccess);
		console.log('url: ', url);
		isSuccess && url && Linking.openURL(url);
	}, [isSuccess, url]);

	return (
		<MainLayout
			styleProp={{
				height: '100%',
				width: '100%',
				alignItems: 'center',
				justifyContent: 'center',
			}}
		>
			<View style={{ alignItems: 'center', paddingHorizontal: 30 }}>
				<Text style={{ textAlign: 'center', marginBottom: 40 }}>
					Subscription to plan successful!
				</Text>
				<Pressable onPress={handleManageBillingClick}>
					<Text style={{ fontWeight: 'bold' }}>
						Manage your billing information
					</Text>
				</Pressable>
				<Pressable onPress={() => navigate('Home')}>
					<Text style={{ fontWeight: 'bold' }}>Go Home</Text>
				</Pressable>
			</View>
		</MainLayout>
	);
};
