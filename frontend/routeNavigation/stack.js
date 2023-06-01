//  When you want to use the stack navigator make sure that "name="<NameOfPage>""
//  <NameOfPage> should match exactly what you are calling on the page that you made
//  If you have questions talk to Peyton about how to do it :)

import { Pressable, Image, View, Text } from 'react-native';

import { createNativeStackNavigator } from '@react-navigation/native-stack'; //Stack navigator Lib

import { NavigationContainer } from '@react-navigation/native';

import { createDrawerNavigator } from '@react-navigation/drawer';
import { useWindowDimensions } from 'react-native';

import { FontAwesomeIcon } from '@fortawesome/react-native-fontawesome';

import { faNavicon } from '@fortawesome/free-solid-svg-icons';

import { useSelector } from 'react-redux';

import { logoBlack } from '../assets/images';

//pages
import {
	Profile,
	Dashboard,
	Template,
	About,
	Wallet,
	WalletRefill,
	SignIn,
	Map,
	Trail,
	Donate,
	PaymentSuccess,
} from '../screens';

import { CustomDrawerContent } from '../components/drawer/DrawerContent';

const Drawer = createDrawerNavigator();

export const Root = () => {
	const dimensions = useWindowDimensions();

	return (
		<Drawer.Navigator
			drawerContent={(props) => <CustomDrawerContent {...props} />}
			screenOptions={({ navigation, route }) => ({
				drawerType: dimensions.width >= 768 ? 'permanent' : 'front',
				headerShown: true,
				headerTransparent: true,
				headerTitle: '',
				headerLeft: (config) => {
					return (
						<Pressable
							style={{ paddingHorizontal: 16 }}
							onPress={navigation.toggleDrawer}
						>
							<FontAwesomeIcon size={24} icon={faNavicon} />
						</Pressable>
					);
				},
				headerRight: (config) => {
					return (
						<View
							style={{
								paddingRight: 10,
								flexDirection: 'row',
								alignItems: 'center',
							}}
						>
							<Text style={{ fontSize: 24, paddingRight: 6, fontWeight: 600 }}>
								{route.name}
							</Text>
							<Text style={{ fontSize: 30, marginBottom: 4 }}>|</Text>
							<Image source={logoBlack} style={{ height: 30, width: 30 }} />
						</View>
					);
				},
			})}
		>
			<Drawer.Screen name='Dashboard' component={Dashboard} />
			<Drawer.Screen name='Wallet' component={Wallet} />
			<Drawer.Screen name='TrailMap' component={Map} />
			<Drawer.Screen name='About' component={About} />
			<Drawer.Screen name='Help' component={Template} />
			<Drawer.Screen name='Profile' component={Profile} />
		</Drawer.Navigator>
	);
};

//creating the navigator
const Stack = createNativeStackNavigator();

export const StackHome = () => {
	const { isLoggedIn } = useSelector((state) => state.auth);
	return (
		<NavigationContainer>
			<Stack.Navigator
				screenOptions={({ route }) => {
					return {
						headerShown: false,
					};
				}}
			>
				{isLoggedIn ? (
					<>
						<Stack.Screen //This makes it so all the base pages on the can access the drawer nav
							name='Root'
							component={Root}
						/>
						<Stack.Screen name='WalletRefill' component={WalletRefill} />
						<Stack.Screen name='Trail' component={Trail} />
						<Stack.Screen name='Donate' component={Donate} />
						<Stack.Screen name='PaymentSuccess' component={PaymentSuccess} />
						<Stack.Screen name='About' component={About} />
					</>
				) : (
					<>
						<Stack.Screen name='Login' component={SignIn} />
					</>
				)}
			</Stack.Navigator>
		</NavigationContainer>
	);
};
