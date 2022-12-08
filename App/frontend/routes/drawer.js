import { createDrawerNavigator } from "@react-navigation/drawer";

import DashboardPage from "../pages/Dashboard";
import AboutPage from "../pages/AboutUs";
import MapPage from "../pages/Map";
import ProfilePage from "../pages/Profile";
import WalletPage from "../pages/Wallet";
import { IconComponent } from "../styles/frontendStyles"
import { SafeAreaProvider } from 'react-native-safe-area-context';


const Drawer = createDrawerNavigator();

const DrawerMenu = () => {
  return (
    <SafeAreaProvider forceInset={{ bottom: 'never'}}>
    <Drawer.Navigator 
    screenOptions={({ navigation }) => ({
      drawerStyle: {
        backgroundColor: '#59C0922C',
      },
      
      headerShown: true,
      headerTransparent: true,
      headerLeft: props => <IconComponent onPress={navigation.toggleDrawer} 
      />,
    })}>
      <Drawer.Screen name="Home" component={DashboardPage} />
      <Drawer.Screen name="About Us" component={AboutPage} />
      <Drawer.Screen name="Trail Map" component={MapPage} />
      <Drawer.Screen name="My Profile" component={ProfilePage} />
      <Drawer.Screen name="My Wallet" component={WalletPage} />
    </Drawer.Navigator>
    </SafeAreaProvider>
  );
};

export { DrawerMenu };
