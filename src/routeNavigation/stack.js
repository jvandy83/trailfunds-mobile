//  When you want to use the stack navigator make sure that "name="<NameOfPage>""
//  <NameOfPage> should match exactly what you are calling on the page that you made
//  If you have questions talk to Peyton about how to do it :)

import { Pressable, Image, View, Text } from "react-native";

import { createNativeStackNavigator } from "@react-navigation/native-stack"; //Stack navigator Lib

import { NavigationContainer } from "@react-navigation/native";

import { createDrawerNavigator } from "@react-navigation/drawer";
import { useWindowDimensions } from "react-native";

import { useAuth0 } from "react-native-auth0";

import { FontAwesomeIcon } from "@fortawesome/react-native-fontawesome";

import { faNavicon } from "@fortawesome/free-solid-svg-icons";

import { trailfundsLogo } from "../assets/images";

//pages
import {
  Profile,
  Home,
  Template,
  About,
  Wallet,
  WalletRefill,
  Login,
  Map,
  Trail,
  Donate,
  PaymentSuccess,
  Subscription,
  PaymentInfo,
} from "../screens";

import { CustomDrawerContent } from "@components/drawer/DrawerContent";

const Drawer = createDrawerNavigator();

export const Root = () => {
  const dimensions = useWindowDimensions();

  return (
    <Drawer.Navigator
      drawerContent={(props) => <CustomDrawerContent {...props} />}
      screenOptions={({ navigation, route }) => ({
        drawerType: dimensions.width >= 768 ? "permanent" : "front",
        title: "",
        headerShown: true,
        headerTransparent: true,
        headerLeft: (config) => {
          return (
            <Pressable
              style={{
                paddingLeft: 16,
              }}
              onPress={navigation.toggleDrawer}
            >
              <FontAwesomeIcon size={24} icon={faNavicon} />
            </Pressable>
          );
        },
        headerRight: (config) => {
          return (
            <View
              style={{
                marginLeft: "-100%",
                flexDirection: "row",
                alignItems: "center",
                paddingRight: "3%",
              }}
            >
              <Text className="font-primary-400 text-2xl">{route.name}</Text>
              <Text
                style={{ fontSize: 30, marginBottom: 4, paddingLeft: "2%" }}
              >
                |
              </Text>
              <Image
                source={trailfundsLogo}
                style={{ height: 30, width: 30 }}
              />
            </View>
          );
        },
      })}
    >
      <Drawer.Screen name="Home" component={Home} />
      <Drawer.Screen name="Wallet" component={Wallet} />
      <Stack.Screen name="Trail" component={Trail} />
      <Drawer.Screen name="Add Funds" component={WalletRefill} />
      <Drawer.Screen name="Map" component={Map} />
      <Drawer.Screen name="About" component={About} />
      <Drawer.Screen name="Help" component={Template} />
      <Drawer.Screen name="Profile" component={Profile} />
      <Stack.Screen name="Success" component={PaymentSuccess} />
      <Stack.Screen name="Payment Info" component={PaymentInfo} />
    </Drawer.Navigator>
  );
};

//creating the navigator
const Stack = createNativeStackNavigator();

export const StackHome = () => {
  const { user } = useAuth0();

  return (
    <NavigationContainer fallback={<Text>Loading...</Text>}>
      <Stack.Navigator
        screenOptions={({ route }) => {
          return {
            headerShown: false,
          };
        }}
      >
        {user ? (
          <>
            <Stack.Screen //This makes it so all the base pages on the can access the drawer nav
              name="Root"
              component={Root}
            />
            <Stack.Screen name="Home" component={Home} />
            <Stack.Screen name="Add Funds" component={WalletRefill} />
            <Stack.Screen name="Trail" component={Trail} />
            <Stack.Screen name="Donate" component={Donate} />
            <Stack.Screen name="About" component={About} />
            <Stack.Screen name="Subscription" component={Subscription} />
            <Stack.Screen name="Payment Info" component={PaymentInfo} />
          </>
        ) : (
          <>
            <Stack.Screen name="Login" component={Login} />
          </>
        )}
      </Stack.Navigator>
    </NavigationContainer>
  );
};
