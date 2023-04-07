import { View, Text, Image } from 'react-native';

import { useGetUserQuery } from '../services/api/auth';

import { PageContainer } from '../components/layout/PageContainer';

import dashboard from '../styles/dashboardStyles';
import { defaults, PrimaryButton } from '../styles/frontendStyles.js';

import TrailFundsLogo from '../assets/images/TrailFundsLogo.png';

export const Dashboard = ({ navigation, route }) => {
	return (
		<View>
			<PageContainer styleProp={defaults.background}>
				<View style={dashboard.welcomeContainer}>
					<Text style={dashboard.trailFunds}>Trail Funds</Text>
					<Image source={TrailFundsLogo} style={dashboard.logo} />
					<Text style={dashboard.welcomeMessage}>Hello</Text>
				</View>
				<PrimaryButton
					text='View Profile'
					onPress={() => navigation.navigate('Profile')}
				/>
				<PrimaryButton
					text='My Wallet'
					onPress={() => navigation.navigate('Wallet')}
				/>
				<PrimaryButton
					text='Recent Donations'
					//onPress={() => navigation.navigate("Donations")}
				/>
			</PageContainer>
		</View>
	);
};
