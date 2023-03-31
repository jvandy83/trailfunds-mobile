import { useState, useEffect } from 'react';
import { View, Text, StyleSheet, Platform, Alert } from 'react-native';

import { PrimaryButton } from '../styles/frontendStyles';

import {
	useStripe,
	usePlatformPay,
	PlatformPayButton,
	PlatformPay,
} from '@stripe/stripe-react-native';

export const Payment = ({
	paymentIntent,
	customer,
	ephemeralKey,
	donationAmount,
}) => {
	const { presentPaymentSheet, initPaymentSheet } = useStripe();

	const { isPlatformPaySupported, confirmPlatformPayPayment } =
		usePlatformPay();

	const [paymentMethod, setPaymentMethod] = useState();
	const [ready, setReady] = useState(true);

	const buyWithApplePay = async () => {
		setReady(false);
		const response = await confirmPlatformPayPayment(paymentIntent, {
			applePay: {
				cartItems: [
					{
						amount: donationAmount,
						paymentType: PlatformPay.PaymentType.Immediate,
					},
				],
				testEnv: true,
				merchantCountryCode: 'US',
				currencyCode: 'USD',
			},
		});

		if (response.error) {
			setReady(true);
			alert(`Error: ${response.error.message}`);
			return;
		}
	};

	const buyWithGooglePay = async () => {
		setReady(false);
		const { error } = await confirmPlatformPayPayment(paymentIntent, {
			googlePay: {
				testEnv: true,
				merchantCountryCode: 'US',
				currencyCode: 'USD',
				billingAddressConfig: {
					format: PlatformPay.BillingAddressFormat.Full,
					isPhoneNumberRequired: true,
					isRequired: true,
				},
			},
		});

		if (error) {
			setReady(true);
			Alert.alert(error.code, error.message);
			// Update UI to prompt user to retry payment (and possibly another payment method)
			return;
		}
		Alert.alert('Success', 'The payment was confirmed successfully.');
	};

	const buyWithCard = async () => {
		setReady(false);
		const { error, paymentOption } = await presentPaymentSheet({
			confirmPayment: false,
		});
		if (error) {
			setReady(true);
			alert(`Error: ${error.message}`);
			return;
		}
		setReady(false);
		setPaymentMethod(paymentOption);
	};

	const initializePaymentSheet = async () => {
		try {
			const { error, paymentOption } = await initPaymentSheet({
				paymentIntentClientSecret: paymentIntent,
				customerEphemeralKeySecret: ephemeralKey,
				customerId: customer.id,
				// customFlow: true,
				merchantDisplayName: 'Trailfunds',
				style: 'alwaysDark', // If darkMode
				googlePay: true, // If implementing googlePay
				applePay: true, // If implementing applePay
				merchantCountryCode: 'US', // Countrycode of the merchant
				// testEnv: process.env.NODE_ENV === 'test', // Set this flag if it's a test environment
			});
			console.log('paymentOption: ', paymentOption);
			setPaymentMethod(paymentOption);
		} catch (error) {
			console.log(error);
		}
	};

	const setup = async () => {
		if (!(await isPlatformPaySupported())) {
			Alert.alert(
				'Error',
				`${
					Platform.OS === 'android' ? 'Google' : 'Apple'
				} Pay is not supported.`,
			);
			return;
		}
	};

	useEffect(() => {
		setup();
		// 	// Initialize the PaymentSheet with the paymentIntent data,
		// 	// we will later present and confirm this
		initializePaymentSheet();
	}, []);
	// add a <Text> with a user's
	// name and thank them for
	// contributing to maintaining
	// their local trails

	return (
		<View style={styles.screen}>
			<View style={styles.paymentHeaderContainer}>
				{ready ? (
					<Text style={styles.paymentHeaderText}>
						{customer?.name}, thank you for being a local trail maintainer!
					</Text>
				) : (
					<Text style={styles.paymentHeaderText}>
						Your donation was a success!
					</Text>
				)}
				{ready && (
					<Text
						style={styles.paymentSubHeaderText}
					>{`Your donation amount is $${donationAmount}.00`}</Text>
				)}
			</View>
			<View style={{ alignItems: 'center' }}>
				<PlatformPayButton
					onPress={Platform.OS === 'ios' ? buyWithApplePay : buyWithGooglePay}
					disabled={!ready}
					style={styles.payButton}
				/>
				<PrimaryButton
					onPress={buyWithCard}
					text='Pay with card'
					disabled={!ready}
					color='white'
				/>
			</View>
		</View>
	);
};

const styles = StyleSheet.create({
	// ...
	screen: {
		paddingHorizontal: 10,
		justifyContent: 'center',
	},
	payButton: {
		borderRadius: 100,
		paddingVertical: 14,
		top: 0.5,
		maxWidth: '80%',
		width: 271,
		height: 48,
	},
	paymentHeaderContainer: {
		paddingVertical: 40,
	},
	paymentHeaderText: {
		fontWeight: 'bold',
		fontSize: 24,
		textAlign: 'center',
	},
	paymentSubHeaderText: {
		fontSize: 18,
		textAlign: 'center',
		color: '#59C092',
		paddingVertical: 20,
	},
});
