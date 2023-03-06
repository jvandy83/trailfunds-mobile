import { createDrawerNavigator } from '@react-navigation/drawer';

import DashboardPage from '../pages/Dashboard';
import AboutPage from '../pages/AboutUs';
import MapPage from '../pages/map/Map';
import WalletPage from '../pages/Wallet';
import TemplatePage from '../pages/Template';
import { IconComponent } from '../styles/frontendStyles';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import { CustomDrawerContent } from '../components';

const Drawer = createDrawerNavigator();

const DrawerMenu = () => {
	return (
		<SafeAreaProvider forceInset={{ bottom: 'never' }}>
			<Drawer.Navigator
				drawerContent={(props) => <CustomDrawerContent {...props} />}
				screenOptions={({ navigation }) => ({
					drawerStyle: {
						backgroundColor: '#59C0922C',
					},

					headerShown: true,
					headerTransparent: true,
					headerLeft: (props) => (
						<IconComponent onPress={navigation.toggleDrawer} />
					),
				})}
			>
				<Drawer.Screen name='Home' component={DashboardPage} />
				<Drawer.Screen name='Wallet' component={WalletPage} />
				<Drawer.Screen name='Map' component={MapPage} />
				<Drawer.Screen name='About' component={AboutPage} />
				<Drawer.Screen name='Help' component={TemplatePage} />
				{/* <Drawer.Screen name='Profile' component={ProfilePage} /> */}
			</Drawer.Navigator>
		</SafeAreaProvider>
	);
};

export { DrawerMenu };
