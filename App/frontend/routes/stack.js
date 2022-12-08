//  When you want to use the stack navigator make sure that "name="<NameOfPage>""
//  <NameOfPage> should match exactly what you are calling on the page that you made
//  If you have questions talk to Peyton about how to do it :)

import { createNativeStackNavigator } from "@react-navigation/native-stack"; //Stack navigator Lib

//pages
import ProfilePage from "../pages/Profile";
import WalletPage from "../pages/Wallet";
//import TransactionPage from "../pages/Transactions";
import Map from "../pages/Map";
import WalletRefills from "../pages/WalletRefill";
import { DrawerMenu } from "./drawer";

//creating the navigator
const Stack = createNativeStackNavigator();

const StackHome = () => {
  return (
    <Stack.Navigator>
      <Stack.Screen //This makes it so all the base pages on the can access the drawer nav
        name="Drawer Home"
        component={DrawerMenu} //Calling the drawer
        options={{ headerShown: false }} //Hiding the header when there are other pages on top of it
      />
      <Stack.Screen name="My Profile" component={ProfilePage} />
      <Stack.Screen name="My Wallet" component={WalletPage} />
      {/* <Stack.Screen name="Donate" component={TransactionPage} /> */}
      <Stack.Screen name="Refill Wallet" component={WalletRefills} />
      <Stack.Screen name="Trail Map" component={Map} />
    </Stack.Navigator>
  );
};

export { StackHome };
