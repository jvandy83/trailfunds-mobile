import "react-native-gesture-handler";
import React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { NavigationContainer } from "@react-navigation/native";
import { DrawerNav } from "./routes/drawer";

export default function App() {
  return (
    <NavigationContainer>
      <DrawerNav />
    </NavigationContainer>
  );
}
