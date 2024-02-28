import React, { useState } from "react";
import { Text, View, StyleSheet, Pressable, Alert } from "react-native";
import { useNavigation } from "@react-navigation/native";
import { useAddSubscriptionMutation } from "../services/api";
import { SecondaryButton } from "../reduxStore/styles/frontendStyles";
import { MainLayout } from "@components/layout/MainLayout";

import * as Linking from "expo-linking";

import { useStripe } from "@stripe/stripe-react-native";

const SUBSCRIPTION_PLAN = {
  BASIC: "price_1OoBqDLlNRWolhfP3uE3TvtK",
  WEEKEND_WARRIOR: "price_1OoBrULlNRWolhfPf4Gt8APf",
  TRAIL_BUILDER: "price_1OoBsiLlNRWolhfP9YUjcUnt",
};

export const Subscription = ({ route }) => {
  const { trailId } = route.params;

  const url = Linking.useURL();

  console.log("***URL***: ", url);

  const [ready, setReady] = useState(true);

  const { presentPaymentSheet, initPaymentSheet } = useStripe();

  const { navigate } = useNavigation();

  const [addSubscription, { isSuccess }] = useAddSubscriptionMutation();

  const initializePaymentSheet = async (clientSecret, ephemeralKey) => {
    try {
      const { error, paymentOption } = await initPaymentSheet({
        paymentIntentClientSecret: clientSecret,
        customerEphemeralKeySecret: ephemeralKey,
        merchantDisplayName: "Trailfunds",
        style: "alwaysDark", // If darkMode
        googlePay: true, // If implementing googlePay
        applePay: true, // If implementing applePay
        merchantCountryCode: "US", // Countrycode of the merchant
        returnURL: `${process.env.EXPO_PUBLIC_BASE_URL}/stripe/stripe-redirect`,
        // testEnv: process.env.NODE_ENV === 'test', // Set this flag if it's a test environment
      });
    } catch (error) {
      console.error(error.data);
    }
  };

  const handleMakeSubscriptionPayment = async (product) => {
    try {
      const { data } = await addSubscription({ product, trailId });
      console.log("**** PAYLOAD FROM ADD SUBSCRIPTION ****: ", data);
      const { ephemeralKey, clientSecret } = data;
      await initializePaymentSheet(clientSecret, ephemeralKey);
    } catch (error) {
      console.error(error);
    }
    const { error, paymentOption } = await presentPaymentSheet({
      confirmPayment: false,
    });
    if (error) {
      alert(`Error: ${error.message}`);
      return;
    }
    Alert.alert(
      "Your payment was successful",
      "You may cancel your subscription at anytime",
      [
        {
          text: "OK",
          onPress: () => {
            setReady(true);
          },
        },
      ]
    );
  };

  return (
    <MainLayout
      styleProp={{
        height: "100%",
        width: "100%",
        alignItems: "center",
        justifyContent: "center",
      }}
    >
      <View
        style={{ alignItems: "center", paddingHorizontal: 30, width: "100%" }}
      >
        <View style={styles.card}>
          <Pressable
            style={({ pressed }) => [{ opacity: pressed ? 0.5 : 1.0 }]}
            onPress={() =>
              handleMakeSubscriptionPayment(SUBSCRIPTION_PLAN.BASIC)
            }
          >
            <View>
              <Text style={{ color: "white", fontWeight: "bold" }}>
                Basic Plan
              </Text>
              <Text style={{ color: "white", fontWeight: "bold" }}>
                $5.00 / month
              </Text>
            </View>
          </Pressable>
        </View>
        <View style={styles.card}>
          <Pressable
            style={({ pressed }) => [{ opacity: pressed ? 0.5 : 1.0 }]}
            onPress={() =>
              handleMakeSubscriptionPayment(SUBSCRIPTION_PLAN.WEEKEND_WARRIOR)
            }
          >
            <View>
              <Text style={{ color: "white", fontWeight: "bold" }}>
                Weekend Warrior
              </Text>
              <Text style={{ color: "white", fontWeight: "bold" }}>
                $10.00 / month
              </Text>
            </View>
          </Pressable>
          {/* Add a hidden field with the lookup_key of your Price */}
        </View>
        <View style={styles.card}>
          <Pressable
            style={({ pressed }) => [{ opacity: pressed ? 0.5 : 1.0 }]}
            onPress={() =>
              handleMakeSubscriptionPayment(SUBSCRIPTION_PLAN.TRAIL_BUILDER)
            }
          >
            <View>
              <Text style={{ color: "white", fontWeight: "bold" }}>
                Trail Builder
              </Text>
              <Text style={{ color: "white", fontWeight: "bold" }}>
                $20.00 / month
              </Text>
            </View>
          </Pressable>
          {/* Add a hidden field with the lookup_key of your Price */}
        </View>
        <SecondaryButton
          text="Go Back"
          color="black"
          backgroundColor="transparent"
          onPress={() => navigate("Trail", { trailId })}
        />
      </View>
    </MainLayout>
  );
};

const styles = StyleSheet.create({
  card: {
    backgroundColor: "#59C092",
    borderColor: "#59C092",
    border: "none",
    borderWidth: 1,
    borderRadius: 5,
    width: "80%",
    alignItems: "center",
    paddingVertical: 10,
    marginVertical: 10,
  },
});
