import React from "react";
import { StatusBar } from "expo-status-bar";
import { Text, View } from "react-native";
import { MainLayout } from '../components/layout/MainLayout';
import { defaults, PrimaryButton } from "../styles/frontendStyles";


export const About = ({ navigation }) => {
  navigateToScreen = () => {
    navigation.navigate("First");
  };
  return (
    <View>
      <MainLayout styleProp={[defaults.background]}>
        <Text>
          This page will contain the information to contact TrailFunds and general
          information about the organization.
        </Text>
        <PrimaryButton text={"test"}/>
        <StatusBar style="auto" />
      </MainLayout>
    </View>
  );
}