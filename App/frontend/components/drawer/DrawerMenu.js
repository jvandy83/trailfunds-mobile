import { useWindowDimensions } from 'react-native';
import { createDrawerNavigator } from '@react-navigation/drawer';

// pages need to be imported individually
// instead of from index.js to prevent
// a dependency cycle warning that may 
// cause errors
import { Dashboard } from '../../pages/Dashboard';
import { About } from '../../pages/About';
import { Map } from '../../pages/map/Map';
import { Wallet } from '../../pages/Wallet';
import { Template } from '../../pages/Template';
import { Profile } from '../../pages/Profile';

import { SafeAreaProvider } from 'react-native-safe-area-context';
import { CustomDrawerContent } from './DrawerContent';

const Drawer = createDrawerNavigator();

export const DrawerMenu = () => {
	const dimensions = useWindowDimensions();
	return (
		<SafeAreaProvider forceInset={{ bottom: 'never' }}>
			<Drawer.Navigator
				useLegacyImplementation
				drawerContent={(props) => <CustomDrawerContent {...props} />}
				drawerStyle={{ backgroundColor: '#59C0922C' }}
				screenOptions={({ navigation }) => ({
					drawerType: dimensions.width >= 768 ? 'permanent' : 'front',
					headerShown: true,
					headerTransparent: true,
				})}
			>
				<Drawer.Screen name='Home' component={Dashboard} />
				<Drawer.Screen name='Wallet' component={Wallet} />
				<Drawer.Screen name='Trail Map' component={Map} />
				<Drawer.Screen name='About' component={About} />
				<Drawer.Screen name='Help' component={Template} />
				<Drawer.Screen name='Profile' component={Profile} />
			</Drawer.Navigator>
		</SafeAreaProvider>
	);
};
