import React from 'react';

import { View, Text, Pressable } from 'react-native';

import { useCreatePortalSessionMutation } from '../services/api';

import { MainLayout } from '../components/layout';

export const CheckoutSuccess = ({ route }) => {
	const { sessionId } = route.params;

	// const [createPortalSession, { isSuccess }] = useCreatePortalSessionMutation();

	// const handleManageBillingClick = async ({route}) => {
	// 	console.log('sessionId: ', sessionId);
	// 	try {
	// 		const { data } = await createPortalSession(sessionId);
	// 		console.log('data about portal session: ', data);
	// 	} catch (error) {
	// 		console.error(error);
	// 	}
	// };

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
