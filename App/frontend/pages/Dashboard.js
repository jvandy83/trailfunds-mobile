import React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { defaults, PrimaryButton } from "../styles/frontendStyles";
import { LinearGradient } from 'expo-linear-gradient';

export default function DashboardPage({ navigation }) {
  return (
    <View>
      <LinearGradient colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']} style={[defaults.background]}>

        <Text>
          The opening page users will view. It will be a dashboard format, Nate is
          working on the design.
        </Text>
        <PrimaryButton
          text="Profile"
          onPress={() => navigation.navigate("Profile")}
        />
        <PrimaryButton
          text="Wallet"
          onPress={() => navigation.navigate("Wallet Page")}
        />
        <PrimaryButton
          text="Testing Style Page"
          onPress={() => navigation.navigate("Style Page")}
        />
        <StatusBar style="auto" />
      </LinearGradient>
    </View>
  );
}
