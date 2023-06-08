import * as React from 'react';
import { Text, View, Image, Alert } from 'react-native';

import { useGetTransactionsQuery } from '../services/api';

import profile from '../styles/profileStyles';

import { MainLayout } from '../components/layout/MainLayout';

import { PrimaryButton, SecondaryButton } from '../styles/frontendStyles';

import { bwGreenhat } from '../assets/images';

export const Profile = () => {
	const { data: transactionData, isLoading, error } = useGetTransactionsQuery();

	if (isLoading) {
		return <Text>Loading...</Text>;
	}

	if (error) {
		console.error(error.detail);
	}

	return (
		<MainLayout styleProp={profile.background}>
			<View style={{ justifyContent: 'center', flex: 1 }}>
				<View
					style={{
						alignItems: 'center',
					}}
				>
					<Image
						source={bwGreenhat}
						style={{
							width: 200,
							height: 200,
							borderRadius: 100,
							overflow: 'hidden',
						}}
						resize='center'
					></Image>
				</View>
				<View style={profile.statsContainer}>
					<View style={profile.statsBox}>
						<Text
							style={[
								profile.text,
								{ fontSize: 30, fontWeight: 'bold', paddingVertical: 8 },
							]}
						>
							{transactionData.length}
						</Text>
						<Text style={[profile.text, profile.subText]}>Donations Made</Text>
					</View>
				</View>

				<View style={{ alignItems: 'center' }}>
					<PrimaryButton
						style={profile.textUse}
						text='Payment Info'
						color='white'
						onPress={() =>
							Alert.alert('This button takes you to payment information')
						}
					/>

					<PrimaryButton
						text='Edit Profile'
						color='white'
						onPress={() =>
							Alert.alert('This button takes you to edit your profile')
						}
					/>

					<SecondaryButton
						text='Learn More'
						color='white'
						onPress={() =>
							Alert.alert('This button takes you to learn more about our app')
						}
					/>
				</View>
			</View>
		</MainLayout>
	);
};
