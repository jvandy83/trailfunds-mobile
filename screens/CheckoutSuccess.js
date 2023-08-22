import React from 'react';

import { View, Text, Pressable } from 'react-native';

import { useCreatePortalSessionMutation } from '../services/api';

import { MainLayout } from '../components/layout';

export const CheckoutSuccess = ({ route }) => {
	const { sessionId } = route.params;

	const [createPortalSession, { isSuccess }] = useCreatePortalSessionMutation();

	const handleManageBillingClick = async () => {
		console.log('sessionId: ', sessionId);
		try {
			const { data } = await createPortalSession(sessionId);
			console.log('data about portal session: ', data);
		} catch (error) {
			console.error(error);
		}
	};

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
					{sessionId}
				</Text>
				<Pressable onPress={handleManageBillingClick}>
					<Text style={{ fontWeight: 'bold' }}>
						Manage your billing subscription
					</Text>
				</Pressable>
			</View>
		</MainLayout>
	);
};
