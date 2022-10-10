import React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { SecondaryButton, PrimaryButton, defaults } from "../styles/frontendStyles";

export default function StyleTest({ navigation }) {
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <Text style={[defaults.greenTextHead]}>Trail Funds</Text>
      {/* This is the main header for our app. This is also how you call the text
      styles */}
      <SecondaryButton text={"test1"} />
      <PrimaryButton text={"test2"} />
      {/* This is the secondary button. Its not on the style sheet so look at the
      include statements to see how to get it on the page. */}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
