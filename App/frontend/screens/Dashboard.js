import { View, Text, Image } from 'react-native';

import { useGetUserQuery } from '../services/api/auth';

import { useSelector } from 'react-redux';

import { PageContainer } from '../components/layout/PageContainer';

import { fetchToken } from '../reduxStore/features/auth/authSlice';

import dashboard from '../styles/dashboardStyles';
import { defaults, PrimaryButton } from '../styles/frontendStyles.js';

import TrailFundsLogo from '../assets/images/TrailFundsLogo.png';

export const Dashboard = ({ navigation, route }) => {
	// console.log(fetchToken('accessToken'));
	const { user } = useSelector((state) => state.auth);
	console.log(user);
	const { data, error, isLoading } = useGetUserQuery(user?.id);

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

	const { user: currentUser } = data;

	const greeting = currentUser.isNew
		? `Welcome ${currentUser.firstName}!`
		: `Welcome back, ${currentUser.firstName}!`;

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
