import React, { useEffect, useState, useRef } from "react";
import { SafeAreaView, StyleSheet, TouchableOpacity, Text, View, Animated} from "react-native";
import MapView from "react-native-maps";
import * as Location from "expo-location";
import { AntDesign, Octicons } from '@expo/vector-icons'; 
import { defaults } from "./frontendStyles"

export const mapStyles = StyleSheet.create({
    map: {
        width: "100%",
        height: "100%",
    },
    mapContainer: {
        paddingTop: 50,
        width: "100%",
        height: "100%",
        backgroundColor: "#59C0922C",
        alignItems: "center",
        justifyContent: "center",
    },
    map_column_container: {
        top: "80%",
        position: "absolute",
        flexDirection: "row",
    },
    map_column: {
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
        textAlign: "center",
        paddingTop: 5,
        paddingBottom: 10,
    },
    like: {
        width: 80,
        height: 80,
        backgroundColor: "#C05987",
        borderRadius: 40,
        flex: 0,
        justifyContent: "center",
        alignItems: "center",
        flexDirection: "column",
        borderWidth: 1,
        borderColor: "#8b355b",
    },
    like_menu: {
        position: "absolute",
        width: "90%",
        height: "25%",
        backgroundColor: "pink",
        // top: 0,
        // bottom: 0,
        // left: 0,
        // right: 0,
    },
    search: {
        width: 80,
        height: 80,
        backgroundColor: "#59C092",
        borderRadius: 40,
        flex: 0,
        justifyContent: "center",
        alignItems: "center",
        flexDirection: "column",
        borderWidth: 1,
        borderColor: "#348963",
    },
    search_menu: {
        width: 50,
        height: 50,
        borderWidth: 2,
        backgroundColor: "green",
    },
    near: {
        width: 80,
        height: 80,
        backgroundColor: "#5F59C0",
        borderRadius: 40,
        flex: 0,
        justifyContent: "center",
        alignItems: "center",
        flexDirection: "column",
        borderWidth: 1,
        borderColor: "#3a358a",
    },
    near_menu: {

    },
  });

export function MapContainer({ }) {
    const [location, setLocation] = useState(null);
    const mapRef = useRef(null);
    let myLat = 37.0902, myLong = 95.7129, myLatDelta = 1, myLongDelta = 1;
  
    useEffect(() => {
      (async () => {
        
        let { status } = await Location.requestForegroundPermissionsAsync();
        if (status !== 'granted') return;
        let location = await Location.getCurrentPositionAsync({});
        setLocation(location);
      })();
    }, []);
  
    if (location) {
      const userRegion = {
        latitude: location.coords.latitude,
        longitude: location.coords.longitude,
        latitudeDelta: 0.1,
        longitudeDelta: 0.1,
      }
      mapRef.current.animateToRegion(userRegion);
    }

    const [isLiked, setLiked] = useState(false);
    const [isSearch, setSearch] = useState(false);
    const [isNear, setNear] = useState(false);
    const scaleSize = 12;
    const animationDuration = 400;
  
    const toggleLiked = () => {
      setSearch(false);
      setNear(false);
      setLiked(isLiked => !isLiked);
    };
  
    const toggleSearch = () => {
      setLiked(false);
      setNear(false);
      setSearch(isSearch => !isSearch);
    };
  
    const toggleNear = () => {
      setLiked(false);
      setSearch(false);
      setNear(isNear => !isNear);
    };
  
    const likeScale = useRef(new Animated.Value(0)).current;
    const searchScale = useRef(new Animated.Value(0)).current;
    const nearScale = useRef(new Animated.Value(0)).current;

        useEffect(() => {
            Animated.timing (
                likeScale,
                {
                toValue: isLiked ? scaleSize : 0,
                duration: animationDuration,
                delay: animationDuration / 4,
                useNativeDriver: false
                },
            ).start()
        }, [likeScale, isLiked]);

        useEffect(() => {
            Animated.timing (
                searchScale,
                {
                toValue: isSearch ? scaleSize : 0,
                duration: animationDuration,
                delay: animationDuration / 4,
                useNativeDriver: false
                },
            ).start()
        }, [searchScale, isSearch]);

        useEffect(() => {
            Animated.timing (
                nearScale,
                {
                toValue: isNear ? scaleSize : 0,
                duration: animationDuration,
                delay: animationDuration / 4,
                useNativeDriver: false
                },
            ).start()
        }, [nearScale, isNear]);
  
    const LikeBackground = () => {
      return (
        <Animated.View
          style={{
            width: 75,
            height: 75,
            borderRadius: "100%",
            backgroundColor: '#a97089',
            opacity: 0.9,
            transform: [{ scale: likeScale }],
          }}/>
      );
    };

    const LikeMenu = (props) => {
        return (
            Animated.View

        )

    }
  
    const SearchBackground  = () => {
      return (
        <Animated.View
          style={{
            width: 75,
            height: 75,
            borderRadius: "100%",
            backgroundColor: '#71a890',
            opacity: 0.9,
            transform: [{ scale: searchScale }],
          }}/>
      );
    };
  
    const NearBackground  = () => {
      return (
        <Animated.View
          style={{
            width: 75,
            height: 75,
            borderRadius: "100%",
            backgroundColor: '#726faa',
            opacity: 0.9,
            transform: [{ scale: nearScale }],
          }}/>
      );
    };


    return (
        <View style={StyleSheet.create({    
            width: "100%",
            height: "100%",
            borderColor: "#80998e",
            borderTopWidth: 2,
            })}>
            <MapView
                ref={mapRef}
                style={mapStyles.map}
                showsUserLocation={true}
                initialRegion={{
                latitude: myLat,
                longitude: myLong,
                latitudeDelta: myLatDelta,
                longitudeDelta: myLongDelta,
                }}/>
            <View style={mapStyles.map_column_container}>
                <View style={mapStyles.map_column}>
                    <LikeBackground/>
                </View>
                <View style={mapStyles.map_column}>
                    <SearchBackground/>
                </View>
                <View style={mapStyles.map_column}>
                    <NearBackground/>
                </View>
            </View>
            <View style={mapStyles.map_column_container}>
                <View style={mapStyles.map_column}>
                    <TouchableOpacity onPress={toggleLiked}>
                        <View style={mapStyles.like}>
                            <AntDesign name="hearto" size={36} color="white" /><Text style={defaults.white_text}>LIKED</Text>
                        </View>
                    </TouchableOpacity>
                </View>
                <View style={mapStyles.map_column}>
                    <TouchableOpacity onPress={toggleSearch}>
                        <View style={mapStyles.search}>
                            <AntDesign name="search1" size={36} color="white" /><Text style={defaults.white_text}>SEARCH</Text>
                        </View>
                    </TouchableOpacity>
                </View>
                <View style={mapStyles.map_column}>
                    <TouchableOpacity onPress={toggleNear}>
                        <View style={mapStyles.near}>
                            <Octicons name="location" size={36} color="white" /><Text style={defaults.white_text}>NEAR</Text>
                        </View>
                    </TouchableOpacity>
                </View>
            </View>
        </View>
    )
}