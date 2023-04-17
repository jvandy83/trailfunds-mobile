//  When you want to use the stack navigator make sure that "name="<NameOfPage>""
//  <NameOfPage> should match exactly what you are calling on the page that you made
//  If you have questions talk to Peyton about how to do it :)

import { Pressable, Image, View } from 'react-native';

import { createNativeStackNavigator } from '@react-navigation/native-stack'; //Stack navigator Lib

import { NavigationContainer } from '@react-navigation/native';

import { createDrawerNavigator } from '@react-navigation/drawer';
import { useWindowDimensions } from 'react-native';

import { FontAwesomeIcon } from '@fortawesome/react-native-fontawesome';

import { faN, faNavicon } from '@fortawesome/free-solid-svg-icons';

import { useSelector } from 'react-redux';

import { logoBlack } from '../assets/images';

//pages
import {
	Profile,
	Wallet,
	Dashboard,
	Template,
	About,
	Donate,
	WalletRefill,
	SignIn,
	Map,
	Trail,
} from '../screens';

import { CustomDrawerContent } from '../components/drawer/DrawerContent';

const Drawer = createDrawerNavigator();

export const DrawerMenu = () => {
	const dimensions = useWindowDimensions();

	return (
		<Drawer.Navigator
			drawerContent={(props) => <CustomDrawerContent {...props} />}
			drawerStyle={{ backgroundColor: '#59C092' }}
			screenOptions={({ navigation }) => ({
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
						<View style={{ paddingHorizontal: 10 }}>
							<Image source={logoBlack} style={{ height: 40, width: 40 }} />
						</View>
					);
				},
			})}
		>
			<Drawer.Screen name='Dashboard' component={Dashboard} />
			<Drawer.Screen name='Wallet' component={Wallet} />
			<Drawer.Screen name='Trail Map' component={Map} />
			<Drawer.Screen name='About' component={About} />
			<Drawer.Screen name='Help' component={Template} />
			<Drawer.Screen name='Profile' component={Profile} />
			<Drawer.Screen name='Donate' component={Donate} />
		</Drawer.Navigator>
	);
};

//creating the navigator
const Stack = createNativeStackNavigator();

// add functionality that
// checks keychain or local storage
// for a valid token

export const StackHome = () => {
	const { isLoggedIn } = useSelector((state) => state.auth);
	return (
		<NavigationContainer>
			<Stack.Navigator
				screenOptions={{
					headerShown: false,
				}}
			>
				{isLoggedIn ? (
					<>
						<Stack.Screen //This makes it so all the base pages on the can access the drawer nav
							name='Drawer Home'
							component={DrawerMenu}
						/>
						<Stack.Screen name='Help' component={Template} />
						<Stack.Screen name='Dashboard' component={Dashboard} />
						<Stack.Screen name='Profile' component={Profile} />
						<Stack.Screen name='Wallet' component={Wallet} />
						<Stack.Screen name='About' component={About} />
						<Stack.Screen name='Wallet Refill' component={WalletRefill} />
						<Stack.Screen name='Trail Map' component={Map} />
						<Stack.Screen name='Donate' component={Donate} />
						<Stack.Screen name='Trail' component={Trail} />
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
