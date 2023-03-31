import React from "react";
import { StatusBar } from "expo-status-bar";
import { Text, View } from "react-native";
import { PageContainer } from '../components/layout/PageContainer';
import { defaults, PrimaryButton } from "../styles/frontendStyles";


export const About = ({ navigation }) => {
  navigateToScreen = () => {
    navigation.navigate("First");
  };
  return (
    <View>
      <PageContainer styleProp={[defaults.background]}>
        <Text>
          This page will contain the information to contact TrailFunds and general
          information about the organization.
        </Text>
        <PrimaryButton text={"test"}/>
        <StatusBar style="auto" />
      </PageContainer>
    </View>
  );
}