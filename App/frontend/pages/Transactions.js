import React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { defaults } from "../styles/frontendStyles";
import { LinearGradient } from 'expo-linear-gradient';

export default function TransactionPage({ navigation }) {
  return (
    <View>
      <LinearGradient colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']} style={[defaults.background]}>
        <Text>
          This page will handle transaction process, like asking the user for
          their payment information that will be sent to Braintree
        </Text>
        <StatusBar style="auto" />
      </LinearGradient>
    </View>
  );
}
