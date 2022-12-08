import { View, Text, Image } from "react-native";
import { defaults, PrimaryButton } from "../styles/frontendStyles.js";
import dashboard from '../styles/dashboardStyles';
import { LinearGradient } from 'expo-linear-gradient';
import TrailFundsLogo from "../assets/images/TrailFundsLogo.png";

export default function DashboardPage({ navigation }) {

  const name = 'Bryan Wachs';

  return (
    <View>
      <LinearGradient colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']} style={defaults.background}>
        <View style={dashboard.welcomeContainer}>
          <Text style={dashboard.trailFunds}>Trail Funds</Text>
          <Image source={TrailFundsLogo} style={dashboard.logo}/>
          <Text style={dashboard.welcomeMessage}>Welcome Back</Text>
          <Text style={dashboard.welcomeName}>{name}</Text>
        </View>
        <PrimaryButton
          text="View Profile"
          onPress={() => navigation.navigate("My Profile")}
        />
        <PrimaryButton
          text="My Wallet"
          onPress={() => navigation.navigate("My Wallet")}
        />
        <PrimaryButton
          text="Recent Donations"
          //onPress={() => navigation.navigate("Donations")}
        />
      </LinearGradient>
    </View>
  );
}