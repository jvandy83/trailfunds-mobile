import React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import PrimaryButton from "../style/primeButt";

export default function DashboardPage({ navigation }) {
  return (
    <View style={styles.container}>
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
      <StatusBar style="auto" />
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
