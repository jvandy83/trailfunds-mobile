import React from "react";
import { StatusBar } from "expo-status-bar";
import { Button, StyleSheet, Text, View } from "react-native";
import { defaults, PrimaryButton } from "../styles/frontendStyles";
import { LinearGradient } from 'expo-linear-gradient';

function AboutPage({ navigation }) {
  navigateToScreen = () => {
    navigation.navigate("First");
  };
  return (
    <View>
      <LinearGradient colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']} style={[defaults.background]}>
        <Text>
          This page will contain the information to contact TrailFunds and general
          information about the organization.
        </Text>
        <PrimaryButton text={"test"}/>
        <StatusBar style="auto" />
      </LinearGradient>
    </View>
  );
}

export default AboutPage;

<Text>
        This page will contain the information to contact TrailFunds and general
        information about the organization.
      </Text>