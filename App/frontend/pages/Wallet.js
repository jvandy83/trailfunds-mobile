import React, { useState, useEffect } from 'react';
import { Text, View, Pressable } from 'react-native';
import { PrimaryButton } from '../styles/frontendStyles';
import { LinearGradient } from 'expo-linear-gradient';
import wallet from '../styles/walletStyles';

import { PaymentScreen } from '../components/stripe/paymentScreen';

const WalletPage = ({ navigation }) => {
	const [showPaymentScreen, setShowPaymentScreen] = useState(false);
	return (
		<LinearGradient
			colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']}
			style={profile.background}
		>
			{!showPaymentScreen ? (
				<View style={wallet.container}>
					<Text style={wallet.label}> Bryan's Wallet</Text>

					<PrimaryButton
						text='Donate'
						onPress={() => setShowPaymentScreen(true)}
					/>
					<PrimaryButton
						text='Refill'
						onPress={() => console.log('refill clicked')}
					/>

					<Pressable style={wallet.secondaryButton}>
						<Text style={[wallet.buttonText, { color: 'white' }]}>Show</Text>
					</Pressable>
				</View>
			) : (
				<PaymentScreen />
			)}
		</LinearGradient>
	);
};

export default WalletPage;
