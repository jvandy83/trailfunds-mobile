import { createDrawerNavigator } from "@react-navigation/drawer";
import AboutPage from "../pages/AboutUs";
import { dashStackNav } from "./dashStack";

const Drawer = createDrawerNavigator();

const DrawerNav = () => {
  return (
    <Drawer.Navigator>
      <DrawerScreen name="Dashboard" component={dashStackNav} />
      <DrawerScreen name="About Us" component={AboutPage} />
    </Drawer.Navigator>
  );
};

export { DrawerNav };
