import React from "react";
import { StatusBar } from "expo-status-bar";
import { Button, StyleSheet, Text, View } from "react-native";
import defaultSty from "../style/defaultSty";
import SecondaryButton from "../style/secondButt";

export default function StyleTest({ navigation }) {
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <Text style={[defaultSty.greenTextHead]}>Trail Funds</Text>
      {/* This is the main header for our app. This is also how you call the text
      styles */}
      <SecondaryButton text={"Test"} />
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
