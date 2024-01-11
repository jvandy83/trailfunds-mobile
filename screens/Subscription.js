import React from "react";
import { Text, View, StyleSheet } from "react-native";
import { useNavigation } from "@react-navigation/native";
import { useAddSubscriptionMutation } from "../services/api";
import { PrimaryButton, SecondaryButton } from "../styles/frontendStyles";
import { MainLayout } from "../components/layout/MainLayout";

import { useStripe } from "@stripe/stripe-react-native";

const SUBSCRIPTION_PLAN = {
  basic: "price_1NgrtELlNRWolhfPBIKCwb1a",
  premium: "price_1NgrtYLlNRWolhfPO902U58n",
};

export const Subscription = ({ route }) => {
  const { trailId } = route.params;

  const { presentPaymentSheet, initPaymentSheet } = useStripe();

  const { navigate } = useNavigation();

  const [addSubscription, { isSuccess }] = useAddSubscriptionMutation();

  const initializePaymentSheet = async (paymentIntent) => {
    try {
      const { error, paymentOption } = await initPaymentSheet({
        paymentIntentClientSecret: paymentIntent,
        merchantDisplayName: "Trailfunds",
        style: "alwaysDark", // If darkMode
        googlePay: true, // If implementing googlePay
        applePay: true, // If implementing applePay
        merchantCountryCode: "US", // Countrycode of the merchant
        // testEnv: process.env.NODE_ENV === 'test', // Set this flag if it's a test environment
      });
    } catch (error) {
      console.error(error.data);
    }
  };

  const handleMakeSubscriptionPayment = async (productId) => {
    try {
      const { data } = await addSubscription(productId);
      await initializePaymentSheet(data.clientSecret);
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
      "You can now donate to your favorite trails!",
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
          <View
            onPress={() =>
              handleMakeSubscriptionPayment(SUBSCRIPTION_PLAN.premium)
            }
          >
            <Text style={{ color: "white", fontWeight: "bold" }}>
              Basic plan
            </Text>
            <Text style={{ color: "white", fontWeight: "bold" }}>
              $5.00 / month
            </Text>
          </View>
        </View>
        <View style={styles.card}>
          <View
            onPress={() =>
              handleMakeSubscriptionPayment(SUBSCRIPTION_PLAN.premium)
            }
          >
            <Text style={{ color: "white", fontWeight: "bold" }}>
              Premium plan
            </Text>
            <Text style={{ color: "white", fontWeight: "bold" }}>
              $20.00 / month
            </Text>
          </View>
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
