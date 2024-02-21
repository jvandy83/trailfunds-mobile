import React, { useState, useEffect } from "react";
import { StatusBar } from "expo-status-bar";
import { Text, View } from "react-native";
import { MainLayout } from "@components/layout/MainLayout";
import { PrimaryButton } from "../reduxStore/styles/frontendStyles";

import * as Linking from "expo-linking";

import { useCreatePortalSessionMutation } from "@services/api";

export const PaymentInfo = ({ navigation }) => {
  const [url, setUrl] = useState("");

  const [
    createPortalSession,
    { isSuccess, isLoading, isUninitialized, error },
  ] = useCreatePortalSessionMutation();

  const handleCreatePortalSession = async () => {
    console.log("CREATING PORTAL SESSION");
    try {
      const { data }: any = await createPortalSession({ arg: null });
      console.log("DATA: ", data);
      setUrl(data.url);
      console.log(data);
    } catch (error: any) {
      console.log(error);
    }
  };

  useEffect(() => {
    url && Linking.openURL(url);
  }, [url]);

  if (isLoading) {
    return (
      <View>
        <Text>Loading</Text>
      </View>
    );
  }

  if (error) {
    console.error(error);
  }

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
          Manage your billing and subscriptions.
        </Text>
        <PrimaryButton
          text={"Manage billing"}
          disabled={false}
          onPress={handleCreatePortalSession}
          color=""
        />
        <StatusBar style="auto" />
      </View>
    </MainLayout>
  );
};
