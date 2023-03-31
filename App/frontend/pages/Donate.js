import { useState, useRef, useEffect } from 'react';
import { View, Text, TextInput, StyleSheet } from 'react-native';

import { Picker } from '@react-native-picker/picker';

import { Payment } from './Payment';

import { PrimaryButton } from '../styles/frontendStyles';

import axios from 'axios';

export const Donate = () => {
	const [amount, setSelectedAmount] = useState({
		customAmount: 0,
		selectAmount: 0,
	});

	const [screenProps, setScreenProps] = useState(null);

	const textInputRef = useRef(null);

	const navigateToCheckout = (screenProps) => {
		setScreenProps(screenProps);
	};

	const handleContinuePress = async () => {
		const donationAmount = amount.selectAmount || amount.customAmount;
		const URL = 'https://trailfunds.ngrok.io/payment-intents';
		try {
			const response = await axios.post(URL, {
				amount: donationAmount,
			});
			const { paymentIntent, customer, ephemeralKey } = response.data;

			/* Navigate to the Payment screen */
			navigateToCheckout({
				ephemeralKey,
				paymentIntent,
				customer,
				donationAmount,
			});
		} catch (error) {
			console.error(error);
		}
	};

	useEffect(() => {
		if (textInputRef.current) {
			textInputRef.current.value = amount.customAmount || 0;
		}
	}, [amount.customAmount]);

	return (
		<View style={styles.paymentScreenContainer}>
			{!screenProps ? (
				<View style={{ alignItems: 'center' }}>
					<Text style={{ fontWeight: 'bold', fontSize: 24 }}>
						Please select an amount
					</Text>
					<Picker
						style={styles.picker}
						selectedValue={amount.customAmount <= 0 ? amount.selectAmount : 0}
						onValueChange={(value, itemIndex) => {
							!amount.customAmount &&
								setSelectedAmount((prev) => ({
									...prev,
									selectAmount: value,
								}));
						}}
					>
						<Picker.Item label='0' value='0' />
						<Picker.Item label='1' value='1' />
						<Picker.Item label='2' value='2' />
						<Picker.Item label='3' value='3' />
						<Picker.Item label='4' value='4' />
						<Picker.Item label='5' value='5' />
						<Picker.Item label='10' value='10' />
						<Picker.Item label='25' value='25' />
						<Picker.Item label='50' value='50' />
						<Picker.Item label='100' value='100' />
					</Picker>
					<View
						style={{ alignItems: 'center' }}
						pointerEvents={amount.selectAmount > 0 ? 'none' : 'auto'}
					>
						<Text style={{ fontSize: 16, fontWeight: 'bold', marginTop: 30 }}>
							Enter a custom amount
						</Text>
						<TextInput
							ref={textInputRef}
							onChangeText={(value) =>
								setSelectedAmount((prev) => ({
									...prev,
									customAmount: value,
								}))
							}
							style={styles.input}
						/>
					</View>
					<View style={{ alignItems: 'center', marginTop: 20 }}>
						<PrimaryButton
							text={`Donate $${
								amount.selectAmount <= 0
									? amount.customAmount
									: amount.selectAmount
							}`}
							onPress={handleContinuePress}
						></PrimaryButton>
					</View>
				</View>
			) : (
				<Payment
					{...screenProps}
					amount={
						amount.selectAmount > 0 ? amount.selectAmount : amount.customAmount
					}
				/>
			)}
		</View>
	);
};

const styles = StyleSheet.create({
	paymentScreenContainer: {
		alignItems: 'center',
		justifyContent: 'center',
		paddingHorizontal: 20,
		flex: 1,
	},
	picker: { width: 200 },
	input: {
		width: 50,
		height: 44,
		padding: 10,
		marginTop: 20,
		marginBottom: 10,
		backgroundColor: '#e8e8e8',
		borderRadius: 6,
	},
});
