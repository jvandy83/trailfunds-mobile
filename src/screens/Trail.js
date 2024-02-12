import { useRef, useState, useEffect } from "react";

import { View, Text } from "react-native";

import { useNavigation } from "@react-navigation/native";

import * as Location from "expo-location";
import MapView from "react-native-map-clustering";
import { Marker } from "react-native-maps";

import {
  useGetTrailQuery,
  useGetUserQuery,
  useDonateMutation,
} from "../services/api";

import {
  PrimaryButton,
  SecondaryButton,
} from "../reduxStore/styles/frontendStyles";

import { mapStyles } from "../reduxStore/styles/mapStyles";

export const Trail = ({ route }) => {
  const mapRef = useRef(null);

  const { trailId } = route.params;

  const [transactionId, setTransactionId] = useState(null);

  const { navigate } = useNavigation();


  const { data, isLoading, error } = useGetTrailQuery(trailId);

  const [donate, { isSuccess }] = useDonateMutation();

  const handleSubmitDollarDonation = async () => {
    try {
      const { data } = await donate({
        // amount must be converted
        // to pennies for Stripe
        amount: 99,
        trailId,
      }).unwrap();
      console.log("UNWRAPPED DATA: ", data)
      const { transactionId } = data;
      setTransactionId(transactionId);
    } catch (error) {
      console.error(error);
    }
  };

  useEffect(() => {
    (async () => {
      try {
        const { status } = await Location.requestForegroundPermissionsAsync();
        if (status !== "granted") return;
      } catch (error) {
        console.error(error);
      }
    })();
  }, []);

  useEffect(() => {
    transactionId && navigate("Success", { transactionId });
  }, [transactionId]);

  if (isLoading) {
    return (
      <View>
        <Text>Loading...</Text>
      </View>
    );
  }

  if (error) {
    console.error(error.detail);
  }

  const initialLocation = {
    latitude: data.trail.latitude,
    longitude: data.trail.longitude,
    latitudeDelta: 0.1,
    longitudeDelta: 0.1,
  };

  mapRef.current?.animateToRegion(initialLocation);

  return (
    <>
      <View
        style={{
          width: "100%",
          height: "50%",
          marginBottom: 20,
        }}
      >
        <View style={{ overflow: "hidden" }}>
          <MapView
            provider={MapView.PROVIDER_GOOGLE}
            ref={mapRef}
            style={mapStyles.map}
            showsUserLocation={true}
            // onRegionChangeComplete={setLocation}
            initialRegion={initialLocation}
            loadingEnabled={true}
            loadingIndicatorColor="#666666"
            loadingBackgroundColor="#eeeeee"
            moveOnMarkerPress={false}
            showsCompass={true}
            showsPointsOfInterest={false}
            customMapStyle={[
              { featureType: "poi", stylers: [{ visibility: "off" }] },
              { featureType: "transit", stylers: [{ visibility: "off" }] },
            ]}
          >
            <Marker
              coordinate={{
                latitude: data.trail.latitude,
                longitude: data.trail.longitude,
              }}
              title={data.trail.name}
            />
          </MapView>
        </View>
      </View>
      <View style={{ alignItems: "center", paddingHorizontal: 10 }}>
        <Text
          style={{
            fontWeight: "bold",
            fontSize: 30,
            paddingVertical: 20,
            color: "#59C092",
            textAlign: "center",
          }}
        >
          {data.trail.name}
        </Text>
        <Text>
          <Text style={{ fontWeight: "bold", fontSize: 16 }}>Trail Org:</Text>
          <Text style={{ fontSize: 16 }}> COPMOBA</Text>
        </Text>
      </View>
      <View className="items-center">
        <PrimaryButton
          text="Donate $0.99"
          color="white"
          onPress={handleSubmitDollarDonation}
        />
        <SecondaryButton
          text="Custom Amount"
          color="white"
          onPress={() => navigate("Donate", { trailId: data.trail.id })}
        />
        <SecondaryButton
          text="Create Subscription"
          color="black"
          backgroundColor="#D2B48C"
          onPress={() => navigate("Subscription", { trailId: data.trail.id })}
        />
        <SecondaryButton
          text="Go Back"
          color="black"
          backgroundColor="transparent"
          onPress={() => navigate("Map")}
        />
      </View>
    </>
  );
};
