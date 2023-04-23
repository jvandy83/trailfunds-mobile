import { View, Text, StyleSheet } from 'react-native';

import { useNavigation } from '@react-navigation/native';

import {
	useGetTrailQuery,
	useGetUserQuery,
	useDonateMutation,
} from '../services/api';

import { PaymentSuccess } from './PaymentSuccess';

import { MainLayout } from '../components/layout/MainLayout';

import { defaults, SecondaryButton } from '../styles/frontendStyles';

export const DonateDollar = ({ route }) => {
	const { trailId, amount } = route.params;

	const { goBack } = useNavigation();

	// RTK Query

	const {
		data: userData,
		isLoading: isUserLoading,
		error: userError,
	} = useGetUserQuery();

	const { data, isLoading, error } = useGetTrailQuery(trailId);

	const [donate, { isSuccess, isUninitialized }] = useDonateMutation();

	/* ----> EVENT HANDLERS <---- */
	// modify local state to
	// control transaction flow

	const handleSubmitDonation = () => {
		donate({ userId: userData.id, amount, trailId });
	};

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

	return (
		<MainLayout styleProp={defaults.background}>
			{isSuccess ? (
				<PaymentSuccess />
			) : (
				<View style={styles.paymentScreenContainer}>
					<View
						style={{
							alignItems: 'center',
							width: '100%',
							paddingHorizontal: 16,
						}}
					>
						<View>
							<Text
								style={{
									fontWeight: 'bold',
									fontSize: 30,
									paddingVertical: 20,
									textAlign: 'center',
								}}
							>
								{data.trail.name}
							</Text>
						</View>
						<View>
							<Text
								style={{
									fontSize: 60,
									color: '#59C092',
									fontWeight: 'bold',
									textShadowOffset: { width: 2, height: 2 },
									textShadowColor: 'rgba(0, 0, 0, 0.2)',
									textShadowRadius: 10,
								}}
							>{`$${amount}.00`}</Text>
						</View>

						<View style={{ alignItems: 'center', marginTop: 30 }}>
							<SecondaryButton
								color='#59C092'
								onPress={handleSubmitDonation}
								text='Donate'
							/>
							<SecondaryButton
								backgroundColor='transparent'
								color='black'
								onPress={() => goBack()}
								text='Go Back'
							/>
						</View>
					</View>
				</View>
			)}
		</MainLayout>
	);
};

const styles = StyleSheet.create({
	paymentScreenContainer: {
		alignItems: 'center',
	},
	payButton: {
		borderRadius: 100,
		paddingVertical: 24,
		marginVertical: 10,
		top: 0.5,
		maxWidth: '80%',
		width: 271,
	},
	donationTab: {
		paddingVertical: 16,
		paddingHorizontal: 26,
	},
	donationTabs: {
		width: 271,
		marginTop: 30,
		justifyContent: 'center',
		flexDirection: 'row',
		borderTopRightRadius: 100,
		borderTopLeftRadius: 100,
		borderBottomRightRadius: 100,
		borderBottomLeftRadius: 100,
		elevation: 5,
		shadowColor: 'rgba(0, 0, 0, 0.1)',
		shadowOpacity: 0.8,
		shadowRadius: 6,
		shadowOffset: {
			height: 1,
			width: 1,
		},
	},
	paymentHeaderText: {
		fontWeight: 'bold',
		fontSize: 24,
		textAlign: 'center',
	},
});
