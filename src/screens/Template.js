import React from "react";
import { StatusBar } from "expo-status-bar";
import { Text, View } from "react-native";
import { MainLayout } from "../components/layout/MainLayout";
import { PrimaryButton } from "../reduxStore/styles/frontendStyles";

export const Template = ({ navigation }) => {
  navigateToScreen = () => {
    navigation.navigate("First");
  };
  return (
    <MainLayout
      styleProp={{
        height: "100%",
        width: "100%",
        alignItems: "center",
        justifyContent: "center",
      }}
    >
      <View style={{ alignItems: "center", paddingHorizontal: 30 }}>
        <Text style={{ textAlign: "center", marginBottom: 40 }}>
          This page will contain general information Trailfunds.
        </Text>
        <PrimaryButton text={"test"} />
        <StatusBar style="auto" />
      </View>
    </MainLayout>
  );
};
