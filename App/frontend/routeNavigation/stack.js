//  When you want to use the stack navigator make sure that "name="<NameOfPage>""
//  <NameOfPage> should match exactly what you are calling on the page that you made
//  If you have questions talk to Peyton about how to do it :)

import { createNativeStackNavigator } from '@react-navigation/native-stack'; //Stack navigator Lib

import { NavigationContainer } from '@react-navigation/native';

import { createDrawerNavigator } from '@react-navigation/drawer';
import { useWindowDimensions } from 'react-native';

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
} from '../screens';

import { CustomDrawerContent } from '../components/drawer/DrawerContent';

const Drawer = createDrawerNavigator();

export const DrawerMenu = () => {
	const dimensions = useWindowDimensions();
	return (
		<Drawer.Navigator
			useLegacyImplementation
			drawerContent={(props) => <CustomDrawerContent {...props} />}
			drawerStyle={{ backgroundColor: '#59C092' }}
			screenOptions={() => ({
				drawerType: dimensions.width >= 768 ? 'permanent' : 'front',
				headerShown: false,
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

const isLoggedIn = true;
// add functionality that
// checks keychain or local storage
// for a valid token

export const StackHome = () => {
	return (
		<NavigationContainer>
			<Stack.Navigator
				screenOptions={{ headerShown: false, initialRouteName: 'Login' }}
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
