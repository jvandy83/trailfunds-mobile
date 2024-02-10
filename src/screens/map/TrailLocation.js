import { View, Text, TouchableOpacity } from "react-native";

import { useGetDistanceFromMeQuery } from "../../services/api";

export const TrailLocation = ({ trail, onPress, locationData }) => {
  const {
    data: distance,
    error,
    isLoading,
  } = useGetDistanceFromMeQuery(
    {
      nearLat: locationData.latitude,
      nearLon: locationData.longitude,
      farLat: trail.latitude,
      farLon: trail.longitude,
    },
    {
      skip: !locationData?.latitude,
    }
  );

  if (error) {
    console.error(error.detail);
  }

  const formattedDistance = Math.round(distance * 10) / 10;

  return (
    <TouchableOpacity onPress={onPress} style={{ paddingVertical: 10 }}>
      <View
        style={{
          flexDirection: "row",
          alignItems: "center",
          justifyContent: "space-between",
        }}
      >
        <Text style={{ fontWeight: "600", fontSize: 14, paddingRight: 4 }}>
          {trail.name}
        </Text>
        <Text style={{ fontWeight: "600", fontSize: 14 }}>
          {isLoading ? <Text></Text> : formattedDistance}
        </Text>
      </View>
    </TouchableOpacity>
  );
};
