import { useState, useRef, useEffect, useCallback } from 'react';
import { View, Text, StyleSheet, Pressable, Alert } from 'react-native';

import {
	useStripe,
	usePlatformPay,
	PlatformPayButton,
	PlatformPay,
} from '@stripe/stripe-react-native';

import { defaults } from '../styles/frontendStyles';

import { CustomInputModal } from '../components/modal/CustomInputModal';

import { PageContainer } from '../components/layout/PageContainer';

import { PrimaryButton } from '../styles/frontendStyles';

import axios from 'axios';

const preselectedInputs = {
	1: 0,
	5: 0,
	10: 0,
	other: '',
};

const currentAmounts = {
	customAmount: 0,
	selectAmount: 1,
};

export const Donate = ({ navigation }) => {
	/* ----> LOCAL STATE <---- */
	const [ready, setReady] = useState(true);

	const [paymentIntent, setPaymentIntent] = useState('');

	const [donationAmount, setDonationAmount] = useState();

	const [verifyPaymentAmount, setVerifiedPaymentAmount] = useState(false);

	const [initPaymentSheetStarted, setInitPaymentSheetStarted] = useState(false);

	const [showCustomAmountInput, setShowCustomAmountInput] = useState(false);

	const [preselectedInputAmount, setPreselectedAmount] = useState({
		1: 1,
		5: 0,
		10: 0,
		other: '',
	});
	const [amount, setSelectedAmount] = useState({
		customAmount: 0,
		selectAmount: 1,
	});

	/* ----> REFS <---- */
	const textInputRef = useRef(null);

	/*----> Stripe SDK <----*/
	const { presentPaymentSheet, initPaymentSheet } = useStripe();

	const { isPlatformPaySupported, confirmPlatformPayPayment } =
		usePlatformPay();

	const buyWithApplePay = async () => {
		setReady(false);
		const response = await confirmPlatformPayPayment(paymentIntent, {
			applePay: {
				cartItems: [
					{
						amount: String(donationAmount),
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
		setReady(false);
		Alert.alert(
			'Your payment was successful',
			'Thank you for being a local trail maintainer!',
			[
				{
					text: 'OK',
					onPress: () => {
						setReady(true);
						setSelectedAmount(currentAmounts);
						setPreselectedAmount({
							1: 1,
							5: 0,
							10: 0,
							other: '',
						});
						navigation.navigate('Wallet');
					},
				},
			],
		);
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
		setReady(false);
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

	const initializePaymentSheet = async (
		paymentIntent,
		customer,
		ephemeralKey,
	) => {
		try {
			const { error, paymentOption } = await initPaymentSheet({
				paymentIntentClientSecret: paymentIntent,
				customerEphemeralKeySecret: ephemeralKey,
				customerId: customer?.id,
				// customFlow: true,
				merchantDisplayName: 'Trailfunds',
				style: 'alwaysDark', // If darkMode
				googlePay: true, // If implementing googlePay
				applePay: true, // If implementing applePay
				merchantCountryCode: 'US', // Countrycode of the merchant
				// testEnv: process.env.NODE_ENV === 'test', // Set this flag if it's a test environment
			});
		} catch (error) {
			console.log(error);
		}
	};

	const handleInitiatePaymentIntent = async () => {
		const donationAmount =
			amount.customAmount > 1 ? amount.customAmount : amount.selectAmount;
		const URL = 'https://trailfunds.ngrok.io/api/v1/payment-intents';
		try {
			const response = await axios.post(URL, {
				amount: donationAmount,
			});
			const { paymentIntent, customer, ephemeralKey } = response.data;

			setPaymentIntent(paymentIntent);
			setDonationAmount(donationAmount);

			await initializePaymentSheet(paymentIntent, customer, ephemeralKey);
		} catch (error) {
			console.error(error);
		}
	};
	/*----> End of Stripe SDK <----*/

	//------------------------------//

	/* ----> EVENT HANDLERS <---- */
	// modify local state to
	// control transaction flow
	const handleCustomAmountClick = () => {
		setPreselectedAmount({ ...preselectedInputs, other: 'other' });
		setSelectedAmount({ selectAmount: 1, customAmount: 0 });

		setShowCustomAmountInput(true);
	};

	const handlePreselectedAmountClick = (value) => {
		if (typeof value === 'number') {
			setPreselectedAmount({ ...preselectedInputs, [value]: value });
			setSelectedAmount({
				customAmount: 0,
				selectAmount: value,
			});
			setVerifiedPaymentAmount(true);
			return;
		}
		handleCustomAmountClick();
	};

	/* ----> USE EFFECTS <---- */
	const reRenderPage = useCallback(() => {
		console.log('screen was focused...');
	});

	// useFocusEffect(reRenderPage);

	useEffect(() => {
		setup();
		handleInitiatePaymentIntent();
	}, []);

	useEffect(() => {
		verifyPaymentAmount && handleInitiatePaymentIntent();
		setInitPaymentSheetStarted(true);
		return () => setVerifiedPaymentAmount(false);
	}, [verifyPaymentAmount]);

	useEffect(() => {
		initPaymentSheetStarted && initializePaymentSheet();
		return () => setInitPaymentSheetStarted(false);
	}, [initPaymentSheetStarted]);

	useEffect(() => {
		if (textInputRef.current) {
			textInputRef.current.value = amount.customAmount || 0;
		}
	}, [amount.customAmount]);

	return (
		<PageContainer styleProp={defaults.background}>
			<View style={styles.paymentScreenContainer}>
				<View
					style={{
						alignItems: 'center',
						width: '100%',
					}}
				>
					<View>
						<Text
							style={{
								fontSize: 56,
								color: '#59C092',
								fontWeight: 'bold',
								textShadowOffset: { width: 2, height: 2 },
								textShadowColor: 'rgba(0, 0, 0, 0.2)',
								textShadowRadius: 10,
							}}
						>{`$${
							amount.customAmount > amount.selectAmount
								? amount.customAmount
								: amount.selectAmount
						}.00`}</Text>
					</View>
					<View style={styles.donationTabs}>
						<Pressable
							onPress={() => handlePreselectedAmountClick(1)}
							style={{
								backgroundColor:
									preselectedInputAmount[1] === 1 ? '#59C092' : 'white',
								borderBottomLeftRadius: 100,
								borderTopLeftRadius: 100,
								...styles.donationTab,
							}}
						>
							<View>
								<Text
									style={{
										color: preselectedInputAmount[1] === 1 ? 'white' : 'gray',
									}}
								>
									$1
								</Text>
							</View>
						</Pressable>
						<Pressable
							onPress={() => handlePreselectedAmountClick(5)}
							style={{
								...styles.donationTab,
								backgroundColor:
									preselectedInputAmount[5] === 5 ? '#59C092' : 'white',
							}}
						>
							<View>
								<Text
									style={{
										color: preselectedInputAmount[5] === 5 ? 'white' : 'gray',
									}}
								>
									$5
								</Text>
							</View>
						</Pressable>
						<Pressable
							onPress={() => handlePreselectedAmountClick(10)}
							style={{
								backgroundColor:
									preselectedInputAmount[10] === 10 ? '#59C092' : 'white',
								...styles.donationTab,
							}}
						>
							<View>
								<Text
									style={{
										color: preselectedInputAmount[10] === 10 ? 'white' : 'gray',
									}}
								>
									$10
								</Text>
							</View>
						</Pressable>
						<Pressable
							onPress={() => handlePreselectedAmountClick()}
							style={{
								...styles.donationTab,
								backgroundColor:
									preselectedInputAmount['other'] === 'other'
										? '#59C092'
										: 'white',
								borderBottomRightRadius: 100,
								borderTopRightRadius: 100,
							}}
						>
							<View>
								<Text
									style={{
										color:
											preselectedInputAmount['other'] === 'other'
												? 'white'
												: 'gray',
									}}
								>
									Other
								</Text>
							</View>
						</Pressable>
					</View>
					<CustomInputModal
						ref={textInputRef}
						showModal={showCustomAmountInput}
						setShowModal={setShowCustomAmountInput}
						onSelectedAmount={setSelectedAmount}
						handlePaymentVerified={setVerifiedPaymentAmount}
					/>
					<View style={{ alignItems: 'center', marginTop: 30 }}>
						<PlatformPayButton
							onPress={
								Platform.OS === 'ios' ? buyWithApplePay : buyWithGooglePay
							}
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
			</View>
		</PageContainer>
	);
};

const styles = StyleSheet.create({
	paymentScreenContainer: {
		alignItems: 'center',
	},
	payButton: {
		borderRadius: 100,
		paddingVertical: 24,
		top: 0.5,
		maxWidth: '80%',
		width: 271,
	},
	donationTab: {
		paddingVertical: 10,
		paddingHorizontal: 22,
	},
	donationTabs: {
		width: 271,
		marginTop: 30,
		justifyContent: 'center',
		flexDirection: 'row',
		borderColor: 'rgba(0, 0, 0, 0.1)',
		borderWidth: 1,
		borderTopRightRadius: 100,
		borderTopLeftRadius: 100,
		borderBottomRightRadius: 100,
		borderBottomLeftRadius: 100,
	},
	paymentHeaderText: {
		fontWeight: 'bold',
		fontSize: 24,
		textAlign: 'center',
	},
});
