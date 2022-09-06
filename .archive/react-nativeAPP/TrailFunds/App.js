import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";

import HomePage from "./pages/Home";
import DonatePage from "./pages/Donate1";
import DonatePage2 from "./pages/Donate2";
import SignUp from "./pages/signUp";
import SignIn from "./pages/signIn";
import LandPage from "./pages/LandingPage";
import ForgotPassword from "./pages/ForgotPassword";
import Verification from "./pages/Verification";
import ResetPassword from "./pages/PassReset";
import Contact from "./pages/contact";
import GMap from "./pages/GMap";
import Geofence from "./pages/Geofence";
import DonateTest from "./pages/donateTest";
import Notification from './pages/notification'
import { Button, alert, Alert } from "react-native-web";

const Stack = createNativeStackNavigator();

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Home">
        <Stack.Screen name="Home" component={HomePage} />
        <Stack.Screen name="Donate" component={DonatePage} />
        <Stack.Screen name="Donate2" component={DonatePage2} />
        <Stack.Screen name="signUp" component={SignUp} />
        <Stack.Screen name="SignIn" component={SignIn} />
        <Stack.Screen name="LandingPage" component={LandPage} />
        <Stack.Screen name="ForgotPassword" component={ForgotPassword} />
        <Stack.Screen name="Verification" component={Verification} />
        <Stack.Screen name="PassReset" component={ResetPassword} />
        <Stack.Screen name="contact" component={Contact} />
        <Stack.Screen name="Geofence" component={Geofence} />
        <Stack.Screen name="GMap" component={GMap} />
        <Stack.Screen name = 'Notification' component={Notification} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;
