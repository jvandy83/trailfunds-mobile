//  When you want to use the stack navigator make sure that "name="<NameOfPage>""
//  <NameOfPage> should match exactly what you are calling on the page that you made
//  If you have questions talk to Peyton about how to do it :)

import { createNativeStackNavigator } from '@react-navigation/native-stack'; //Stack navigator Lib

//pages
import { Profile } from '../screens/Profile';
import { Wallet } from '../screens/Wallet';
import { Dashboard } from '../screens/Dashboard';
import { Template } from '../screens/Template';
import { About } from '../screens/About';
import { Donate } from '../screens/Donate';
import { Payment } from '../screens/Payment';
import { WalletRefill } from '../screens/WalletRefill';
import { SignIn } from '../screens/SignIn';
import { Map } from '../screens/map/Map';

import { DrawerMenu } from '../components/drawer/DrawerMenu';

//creating the navigator
const Stack = createNativeStackNavigator();

export const StackHome = () => {
	return (
		<Stack.Navigator>
			<Stack.Screen //This makes it so all the base pages on the can access the drawer nav
				name='Drawer Home'
				component={DrawerMenu} //Calling the drawer
				options={{ headerShown: false }} //Hiding the header when there are other pages on top of it
			/>
			<Stack.Screen name='Help' component={Template} />
			<Stack.Screen name='Home' component={Dashboard} />
			<Stack.Screen name='Profile' component={Profile} />
			<Stack.Screen name='Wallet' component={Wallet} />
			<Stack.Screen name='About' component={About} />
			{/* <Stack.Screen name="Donations" component={TransactionPage} /> */}
			<Stack.Screen name='Wallet Refill' component={WalletRefill} />
			<Stack.Screen name='Trail Map' component={Map} />
			<Stack.Screen name='Donate' component={Donate} />
			<Stack.Screen name='Payment' component={Payment} />
			<Stack.Screen name='Login' component={SignIn} />
		</Stack.Navigator>
	);
};
