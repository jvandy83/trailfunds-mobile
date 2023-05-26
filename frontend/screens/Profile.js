import * as React from 'react';
import {
	Text,
	View,
	Image,
	ScrollView,
	TouchableOpacity,
	Alert,
	Button,
} from 'react-native';

import profile from '../styles/profileStyles';

import { MainLayout } from '../components/layout/MainLayout';

import { PrimaryButton, SecondaryButton } from '../styles/frontendStyles';

import { bwGreenhat } from '../assets/images';

import { MaterialIcons } from '@expo/vector-icons';

export const Profile = () => {
	return (
		<MainLayout styleProp={profile.background}>
			<View style={{ justifyContent: 'center', flex: 1 }}>
				<View
					style={{
						alignItems: 'center',
						position: 'relative',
					}}
				>
					<View style={profile.profileImage}>
						<Image
							source={bwGreenhat}
							style={profile.image}
							resize='center'
						></Image>
					</View>

					<View
						style={{
							backgroundColor: '#41444B',
							position: 'absolute',
							top: 20,
							width: 40,
							height: 40,
							borderRadius: 100,
							alignItems: 'center',
							justifyContent: 'center',
							position: 'absolute',
							top: 0,
							left: 100,
						}}
					>
						<MaterialIcons
							name='chat'
							size={18}
							color='#DFD8C8'
						></MaterialIcons>
					</View>
				</View>

				<View style={profile.statsContainer}>
					<View
						style={[
							profile.statsBox,
							{
								borderColor: '#DFD8C8',
								borderLeftWidth: 1,
								borderRightWidth: 1,
							},
						]}
					>
						<Text style={[profile.text, { fontSize: 30 }]}>12</Text>
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
