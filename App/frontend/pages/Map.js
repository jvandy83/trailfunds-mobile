import React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { defaults } from "../styles/frontendStyles";
import { LinearGradient } from 'expo-linear-gradient';

export default function MapPage({ navigation }) {
  return (
    <View>
      <LinearGradient colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']} style={[defaults.background]}>
        <Text>
          This page will display a map of the trailheads that TrailFunds supports
          donating to for users to select and donate to.
        </Text>
        <StatusBar style="auto" />
      </LinearGradient>
    </View>
  );
}
