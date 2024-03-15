import React, {
  useCallback,
  useMemo,
  useRef,
  useEffect,
  useState,
} from "react";

import {
  View,
  Text,
  StyleSheet,
  TextInput,
  Pressable,
  ScrollView,
  SafeAreaView,
  ActivityIndicator,
} from "react-native";

import { useNavigation } from "@react-navigation/native";

import { Picker } from "@react-native-picker/picker";

import {
  BottomSheetModal,
  BottomSheetModalProvider,
} from "@gorhom/bottom-sheet";

import { TrailLocation } from "./TrailLocation";

import axios from "axios";

import uuid from "react-native-uuid";

export const TrailDataBottomSheet = ({
  data,
  setRadius,
  radius,
  locationData,
}) => {
  // ref
  const bottomSheetModalRef = useRef(null);

  const [queryData, setQueryData] = useState([]);

  const [searchItem, setSearchItem] = useState("");

  const [loadingTrails, setLoadingTrails] = useState(false);

  const [selectedRadiusValue, setSelectedRadiusValue] = useState(radius);

  const { navigate } = useNavigation();

  const handleSheetChanges = useCallback((index) => {
    // this keeps modal from closing all the way
    // and leaving the screen
    bottomSheetModalRef.current?.present();
  }, []);

  const renderTrails = useCallback(
    (trail) => (
      <TrailLocation
        locationData={locationData}
        trail={trail}
        onPress={() => navigate("Trail", { trailId: trail.id })}
        key={uuid.v4()}
      />
    ),
    []
  );

  const renderPicker = () => {
    const arr = [];
    let i = 0;
    while (i < 50) {
      i++;
      arr.push(i);
    }
    return arr.map((num) => (
      <Picker.Item key={uuid.v4()} label={`${num}`} value={`${num}`} />
    ));
  };

  const snapPoints = useMemo(() => ["18%", "50%", "75%"], []);

  useEffect(() => {
    bottomSheetModalRef.current?.present();
  }, []);

  useEffect(() => {
    setLoadingTrails(true);
    const delaySearchFn = setTimeout(() => {
      axios
        .get(
          `${process.env.EXPO_PUBLIC_BASE_URL}/trails/search-trails?query=${searchItem}`
        )
        .then((res) => {
          setQueryData(res.data);
          setLoadingTrails(false);
        })
        .catch((error) => {
          setLoadingTrails(false);
          console.error(error);
        });
    }, 1100);
    return () => clearTimeout(delaySearchFn);
  }, [searchItem]);

  // renders
  return (
    <BottomSheetModalProvider>
      <View style={styles.container}>
        <BottomSheetModal
          ref={bottomSheetModalRef}
          index={1}
          snapPoints={snapPoints}
          onChange={handleSheetChanges}
        >
          <View
            style={{
              paddingTop: 20,
              paddingHorizontal: 30,
            }}
          >
            <Text className="text-2xl font-primary-600 pb-5 text-primary">
              Find A Trail
            </Text>
            <TextInput
              placeholder="Search"
              onChangeText={(text) => setSearchItem(text)}
              style={{
                marginVertical: 15,
                paddingVertical: 10,
                paddingHorizontal: 20,
                borderWidth: 1,
                borderColor: "rgba(0, 0, 0, 0.2)",
                borderRadius: 100,
              }}
            />
            <View>
              {loadingTrails ? (
                <ActivityIndicator />
              ) : (
                queryData.trails?.map(renderTrails)
              )}
            </View>
            <View
              style={{
                flexDirection: "row",
                justifyContent: "space-around",
                paddingVertical: 20,
              }}
            >
              <Pressable
                style={{
                  borderBottomColor: "#59C092",
                  borderBottomWidth: 2,
                }}
              >
                <Text className="font-primary-500 text-primary text-lg">
                  Favorite
                </Text>
              </Pressable>
              <Pressable>
                <Text className="font-primary-500 text-primary text-lg">
                  Recent
                </Text>
              </Pressable>
            </View>
            <View
              style={{
                flexDirection: "row",
                justifyContent: "space-between",
                alignItems: "center",
                marginBottom: 5,
                height: 60,
                overflow: "hidden",
              }}
            >
              <Text
                className="text-2xl font-primary-600 "
                style={{
                  fontSize: 20,
                  fontWeight: "bold",
                  color: "#59C092",
                }}
              >
                Trails Near Me
              </Text>
              <View
                style={{
                  flexDirection: "row",
                  justifyContent: "center",
                  alignItems: "center",
                }}
              >
                <Picker
                  style={{ width: "50%" }}
                  selectedValue={selectedRadiusValue}
                  onValueChange={(itemValue, itemIndex) => {
                    setSelectedRadiusValue(itemValue);
                    setRadius(itemValue);
                  }}
                >
                  {renderPicker()}
                </Picker>
                <Text style={{ fontSize: 16 }}>mi</Text>
              </View>
            </View>
            <ScrollView style={{ flexGrow: 1 }}>
              <SafeAreaView>
                <View>{data.trails.map(renderTrails)}</View>
              </SafeAreaView>
            </ScrollView>
          </View>
        </BottomSheetModal>
      </View>
    </BottomSheetModalProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    padding: 24,
    justifyContent: "center",
  },
});
