import React from "react";
import { StatusBar } from "expo-status-bar";
import { View } from "react-native";
import { mapStyles, MapContainer } from "../styles/mapStyles";
import { SafeAreaProvider } from 'react-native-safe-area-context';

export default function MapPage({ navigation }) {
  return (
    <SafeAreaProvider style={mapStyles.mapContainer} forceInset={{ bottom: 'never'}}>
      <View style={mapStyles.mapContainer}>
        <MapContainer/>
        <StatusBar style="auto" />
      </View>
    </SafeAreaProvider>
  );
}
