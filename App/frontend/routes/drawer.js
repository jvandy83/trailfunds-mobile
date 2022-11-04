import { createDrawerNavigator } from "@react-navigation/drawer";

import DashboardPage from "../pages/Dashboard";
import AboutPage from "../pages/AboutUs";
import MapPage from "../pages/Map";
import ProfilePage from "../pages/Profile";
import WalletPage from "../pages/Wallet";
import { setStatusBarTranslucent } from "expo-status-bar";

const Drawer = createDrawerNavigator();

const DrawerMenu = () => {
  return (
    <Drawer.Navigator screenOptions={{ headerShown: true, headerStyle: {height: 0}}}>
      <Drawer.Screen name="Home" component={DashboardPage} />
      <Drawer.Screen name="About Us" component={AboutPage} />
      <Drawer.Screen name="Map" component={MapPage} />
      <Drawer.Screen name="Profile" component={ProfilePage} />
      <Drawer.Screen name="Wallet Page" component={WalletPage} />
    </Drawer.Navigator>
  );
};

export { DrawerMenu };
