import React from "react";
import { Text, View } from "react-native";
import { SecondaryButton, PrimaryButton, defaults } from "../styles/frontendStyles";
import { LinearGradient } from 'expo-linear-gradient';


export default function StyleTest({ navigation }) {
  return (
    <View style={defaults.container}>
      <LinearGradient colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']} style={[defaults.background]}>
        <Text style={[defaults.greenTextHead]}>Trail Funds</Text>
        <SecondaryButton text={"test1"} />
        <PrimaryButton text={"test2"} />
      </LinearGradient>
    </View>
  );
}

/* COPY AND PASTE THIS INTO ALL NEW PAGES

import React from "react";
import { View } from "react-native";
import { defaults } from "../styles/frontendStyles";
import { LinearGradient } from 'expo-linear-gradient';

export default function <PAGE_NAME>({ navigation }) {
  return (
    <View style={defaults.container}>
      <LinearGradient colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']} style={[defaults.background]}>
        <StatusBar style="auto"/>
      </LinearGradient>
    </View>
  );

*/