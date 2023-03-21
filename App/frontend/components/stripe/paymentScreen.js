import { useState, useEffect } from 'react';
import { View, Text, Alert } from 'react-native';
import {
	CardField,
	CardForm,
	useStripe,
	GooglePayButton,
	useGooglePay,
} from '@stripe/stripe-react-native';

import { Picker } from '@react-native-picker/picker';

import { PrimaryButton } from '../../styles/frontendStyles';

import axios from 'axios';

export const PaymentScreen = () => {
	const { createGooglePayPaymentMethod } = useGooglePay();
	const {
		initPaymentSheet,
		presentPaymentSheet,
		initGooglePay,
		presentGooglePay,
	} = useStripe();

	const [amount, setSelectedAmount] = useState(0);

	const [card, setCard] = useState();

	const [clientSecret, setClientSecret] = useState('');

	const fetchPaymentIntentClientSecret = async () => {
		// Fetch payment intent created on the server, see above
		const res = await axios.post('http://localhost:5000/payment_intents', {
			amount,
		});

		return res.data.payment_intent;
	};

	const pay = async () => {
		const clientSecret = await fetchPaymentIntentClientSecret();

		const { error, paymentMethod } = await createGooglePayPaymentMethod(
			clientSecret,
			{
				googlePay: {
					testEnv: true,
					amount,
					merchantName: 'My merchant name',
					merchantCountryCode: 'US',
					currencyCode: 'USD',
				},
			},
		);

		if (error) {
			Alert.alert(error.code, error.message);
			// Update UI to prompt user to retry payment (and possibly another payment method)
			return;
		}
		Alert.alert(
			'Success',
			'The payment was confirmed successfully. paymentMethodId: ',
			paymentMethod.id,
		);
	};

	const onCheckout = async () => {
		const res = await axios.post('http://localhost:5000/payment_intents', {
			amount,
		});
		console.log(res.data);
		const paymentIntent = res.data.payment_intent;
		// 2. Initialize the Payment sheet
		const { error: paymentSheetError } = await initPaymentSheet({
			merchantDisplayName: 'Example, Inc.',
			paymentIntentClientSecret: paymentIntent,
			defaultBillingDetails: {
				name: 'Jane Doe',
			},
		});
		if (paymentSheetError) {
			Alert.alert('Something went wrong', paymentSheetError.message);
			return;
		}
		const { error: paymentError } = await presentPaymentSheet();

		if (paymentError) {
			Alert.alert(`Error code: ${paymentError.code}`, paymentError.message);
			return;
		}
	};

	return (
		<View
			style={{
				alignItems: 'center',
				justifyContent: 'center',
				paddingHorizontal: 20,
				flex: 1,
			}}
		>
			<View style={{ alignItems: 'center' }}>
				<Text>Please select an amount</Text>
				<Picker
					style={{ width: 200 }}
					selectedValue={amount}
					onValueChange={(itemValue, itemIndex) => {
						setSelectedAmount(itemValue);
					}}
				>
					<Picker.Item label='1' value='1' />
					<Picker.Item label='2' value='2' />
					<Picker.Item label='3' value='3' />
					<Picker.Item label='4' value='4' />
					<Picker.Item label='5' value='5' />
				</Picker>
				<PrimaryButton
					text={`Donate $${amount}`}
					onPress={onCheckout}
					color='white'
				/>
			</View>
			{/* <CardForm
				onFormComplete={(cardDetails) => {
					console.log('card details', cardDetails);
					setCard(cardDetails);
				}}
				onCardChange={(cardDetails) => {
					console.log('cardDetails', cardDetails);
				}}
				onFocus={(focusedField) => {
					console.log('focusField', focusedField);
				}}
				style={{
					height: 200,
					width: '100%',
				}}
			/> */}
		</View>
	);
};
