import React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { PrimaryButton } from "../styles/frontendStyles";

export default function WalletPage({ navigation }) {
  return (
    <View style={styles.container}>
      <Text>
        This will show the users wallet information. Clarification on what that
        will all entail is a WIP.
      </Text>
      <PrimaryButton
        text="Transaction Page"
        onPress={() => navigation.navigate("Transaction Page")}
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
