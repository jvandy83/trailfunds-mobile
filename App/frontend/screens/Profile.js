import * as React from 'react';
import {
	Text,
	View,
	Image,
	ScrollView,
	TouchableOpacity,
	Button,
	Alert,
} from 'react-native';

import profile from '../styles/profileStyles';

import { PageContainer } from '../components/layout/PageContainer';

import ProfilePic from '../assets/images/profile-pic.jpeg';

import { Ionicons, MaterialIcons } from '@expo/vector-icons';

export const Profile = () => {
	return (
		<PageContainer styleProp={profile.background}>
			<ScrollView showsVerticalScrollIndicator={false}>
				<View>
					<View style={profile.titleBar}>
						<Ionicons
							none='ios-arrow-back'
							size={24}
							color='#52575D'
						></Ionicons>
						<Ionicons none='md-more' size={24} color='#52575D'></Ionicons>
					</View>

					<View style={{ alignSelf: 'center' }}>
						<View style={profile.profileImage}>
							<Image
								source={ProfilePic}
								style={profile.image}
								resize='center'
							></Image>
						</View>

						<View style={profile.dm}>
							<MaterialIcons
								name='chat'
								size={18}
								color='#DFD8C8'
							></MaterialIcons>
						</View>

						<View style={profile.active}></View>

						<View style={profile.add}>
							<Ionicons
								name='ios-add'
								size={48}
								color='#DFD8C8'
								style={{ marginTop: 6, marginLeft: 2 }}
							></Ionicons>
						</View>
					</View>

					<View style={profile.infoContainer}>
						<Text style={[profile.text, { fontWeight: '300', fontSize: 36 }]}>
							Hello
						</Text>
					</View>

					<View style={profile.infoContainer}>
						<Text style={[profile.text, { fontWeight: '200', fontSize: 36 }]}>
							Maeve Hungerford
						</Text>
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

				<TouchableOpacity>
					<View style={profile.paymentButton}>
						<Button
							style={profile.textUse}
							title='Payment Info'
							color='black'
							onPress={() =>
								Alert.alert('This button takes you to payment information')
							}
						/>
					</View>
				</TouchableOpacity>

				<TouchableOpacity>
					<View style={profile.profileButton}>
						<Button
							title='Edit Profile'
							color='black'
							onPress={() =>
								Alert.alert('This button takes you to edit your profile')
							}
						/>
					</View>
				</TouchableOpacity>

				<TouchableOpacity>
					<View style={profile.learnButton}>
						<Button
							title='Learn More'
							color='white'
							onPress={() =>
								Alert.alert('This button takes you to learn more about our app')
							}
						/>
					</View>
				</TouchableOpacity>
			</ScrollView>
		</PageContainer>
	);
};
