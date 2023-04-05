import { useWindowDimensions } from 'react-native';
import { createDrawerNavigator } from '@react-navigation/drawer';

// pages need to be imported individually
// instead of from index.js to prevent
// a dependency cycle warning that may
// cause errors
import { Dashboard } from '../../screens/Dashboard';
import { About } from '../../screens/About';
import { Map } from '../../screens/map/Map';
import { Wallet } from '../../screens/Wallet';
import { Template } from '../../screens/Template';
import { Profile } from '../../screens/Profile';
import { Donate } from '../../screens/Donate';
import { SignIn } from '../../screens/SignIn';

import { CustomDrawerContent } from './DrawerContent';

const Drawer = createDrawerNavigator();

export const DrawerMenu = () => {
	const dimensions = useWindowDimensions();
	return (
		<Drawer.Navigator
			useLegacyImplementation
			drawerContent={(props) => <CustomDrawerContent {...props} />}
			drawerStyle={{ backgroundColor: '#59C0922C' }}
			screenOptions={({ navigation }) => ({
				drawerType: dimensions.width >= 768 ? 'permanent' : 'front',
				headerShown: false,
				headerTransparent: true,
			})}
		>
			<Drawer.Screen name='Home' component={Dashboard} />
			<Drawer.Screen name='Wallet' component={Wallet} />
			<Drawer.Screen name='Trail Map' component={Map} />
			<Drawer.Screen name='About' component={About} />
			<Drawer.Screen name='Help' component={Template} />
			<Drawer.Screen name='Profile' component={Profile} />
			<Drawer.Screen name='Donate' component={Donate} />
			<Drawer.Screen name='Login' component={SignIn} />
		</Drawer.Navigator>
	);
};
