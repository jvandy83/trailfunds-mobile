import { View, Text, Image } from 'react-native';

import { useGetUserQuery } from '../services/api';

import { PageContainer } from '../components/layout/PageContainer';

import dashboard from '../styles/dashboardStyles';
import { defaults, PrimaryButton } from '../styles/frontendStyles.js';

import TrailFundsLogo from '../assets/images/TrailFundsLogo.png';

export const Dashboard = ({ navigation }) => {
	const {
		data: user,
		error,
		isLoading,
	} = useGetUserQuery({ refetchOnMountOrArgChange: true });

	console.log('*** user ***: ', user);

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

	const greeting = user.isNew
		? `Welcome ${user.firstName}!`
		: `Welcome back, ${user.firstName}!`;

	return (
		<View>
			<PageContainer styleProp={defaults.background}>
				<View style={dashboard.welcomeContainer}>
					<Text style={dashboard.trailFunds}>Trail Funds</Text>
					<Image source={TrailFundsLogo} style={dashboard.logo} />
					<Text style={dashboard.welcomeMessage}>{greeting}</Text>
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
