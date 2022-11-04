import React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { defaults, PrimaryButton } from "../styles/frontendStyles";
import { LinearGradient } from 'expo-linear-gradient';

export default function WalletPage({ navigation }) {
  return (
    <View>
      <LinearGradient colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']} style={[defaults.background]}>
        <Text>
          This will show the users wallet information. Clarification on what that
          will all entail is a WIP.
        </Text>
        <PrimaryButton
          text="Transaction Page"
          onPress={() => navigation.navigate("Transaction Page")}
        />
        <StatusBar style="auto" />
      </LinearGradient>
    </View>
  );
}
