import React from "react";
import { StatusBar } from "expo-status-bar";
import { Button, StyleSheet, Text, View } from "react-native";
import { PrimaryButton } from "../styles/frontendStyles";

function AboutPage({ navigation }) {
  navigateToScreen = () => {
    navigation.navigate("First");
  };
  return (
    <View style={styles.container}>
      <Text>
        This page will contain the information to contact TrailFunds and general
        information about the organization.
      </Text>
      <PrimaryButton text={"test"}/>
      <StatusBar style="auto" />
    </View>
  );
}

export default AboutPage;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
