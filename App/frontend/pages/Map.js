import React, { useEffect, useState, useRef } from "react";
import { StatusBar } from "expo-status-bar";
import { SafeAreaView, StyleSheet, TouchableOpacity, Text, View, Animated, FlatList} from "react-native";
import { mapStyles, MapContainer } from "../styles/mapStyles";
import { defaults } from "../styles/frontendStyles";
import Collapsible from 'react-native-collapsible';
import MapView from "react-native-maps";
import * as Location from "expo-location";
import { AntDesign, Octicons, MaterialIcons } from '@expo/vector-icons'; 

// TODO: Map GeoFence Polygons + Search Function (on-click polygons opens info drawer)

export default function MapPage({ }) {
  // Static Demo Variables --- Replace with live data from backend:
  var likedTrails = [{name: "A Liked Trail", id: 0}, {name: "Some Liked Trail", id: 1}, {name: "Some Other Really Really Long-Named Liked Trail", id: 2}, {name: "A Third Liked Trail", id: 3}, {name: "Another Liked Trail", id: 4}, {name: "Yet Another Liked Trail", id: 5}, {name: "Yet Another Liked Trail", id: 6}, {name: "Yet Another Liked Trail", id: 7}, {name: "Yet Another Liked Trail", id: 8}, {name: "Yet Another Liked Trail", id: 9}, {name: "Yet Another Liked Trail", id: 10}, {name: "Yet Another Liked Trail", id: 11}, {name: "Yet Another Liked Trail", id: 12}, {name: "Yet Another Liked Trail", id: 13}, {name: "Yet Another Liked Trail", id: 14}, {name: "Yet Another Liked Trail", id: 15}]
  var nearTrails = [{name: "A Liked Trail", id: 0}, {name: "Some Liked Trail", id: 1}, {name: "Some Other Really Really Long-Named Liked Trail", id: 2}, {name: "A Third Liked Trail", id: 3}, {name: "Another Liked Trail", id: 4}, {name: "Yet Another Liked Trail", id: 5}, {name: "Yet Another Liked Trail", id: 6}, {name: "Yet Another Liked Trail", id: 7}, {name: "Yet Another Liked Trail", id: 8}, {name: "Yet Another Liked Trail", id: 9}, {name: "Yet Another Liked Trail", id: 10}, {name: "Yet Another Liked Trail", id: 11}, {name: "Yet Another Liked Trail", id: 12}, {name: "Yet Another Liked Trail", id: 13}, {name: "Yet Another Liked Trail", id: 14}, {name: "Yet Another Liked Trail", id: 15}]

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
    const [isLikeMenu, setLikeMenu] = useState(false);
    const [isSearch, setSearch] = useState(false);
    const [isSearchMenu, setSearchMenu] = useState(false);
    const [isNear, setNear] = useState(false);
    const [isNearMenu, setNearMenu] = useState(false);
    const scaleSize = 12;
    const animationDuration = 400;

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

    const likeAnimationHandler = () => {
        if (isLiked) {
            setSearch(false);
            setSearchMenu(false);
            setNear(false);
            setNearMenu(false);
            setLikeMenu(isLikeMenu => !isLikeMenu);
            setLiked(isLiked => !isLiked);
        } else {
            setSearch(false);
            setSearchMenu(false);
            setNear(false);
            setNearMenu(false);
            setLiked(isLiked => !isLiked);
            setTimeout(() => {setLikeMenu(isLikeMenu => !isLikeMenu);}, animationDuration + 200);
        }
    }


    const searchAnimationHandler = () => {
        if (isSearch) {
            setLiked(false);
            setLikeMenu(false);
            setNear(false);
            setNearMenu(false);
            setSearchMenu(isSearchMenu => !isSearchMenu);
            setSearch(isSearch => !isSearch);
        } else {
            setLiked(false);
            setLikeMenu(false);
            setNear(false);
            setNearMenu(false);
            setSearch(isSearch => !isSearch);
            setTimeout(() => {setSearchMenu(isSearchMenu => !isSearchMenu);}, animationDuration + 200);
        }
    }


    const nearAnimationHandler = () => {
        if (isNear) {
            setLiked(false);
            setLikeMenu(false);
            setSearch(false);
            setSearchMenu(false);
            setNearMenu(isNearMenu => !isNearMenu);
            setNear(isNear => !isNear);
        } else {
            setLiked(false);
            setLikeMenu(false);
            setSearch(false);
            setSearchMenu(false);
            setNear(isNear => !isNear);
            setTimeout(() => {setNearMenu(isNearMenu => !isNearMenu);}, animationDuration + 200);
        }
    }
  
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
        ).start();
    }, [likeScale, isLiked, isLikeMenu]);

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

    const Item = ({ item }) => (
      <TouchableOpacity style={mapStyles.list_box}>
        <Text style={mapStyles.list_text} numberOfLines={1}>
          <MaterialIcons name="location-pin" size={22} color="white" />
          {item.name}
        </Text>
      </TouchableOpacity>
    );
  
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
      <View style={mapStyles.mapContainer}>
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
                    <View style={{...mapStyles.like_menu, display: isLikeMenu ? 'flex' : 'none'}}>
                      <View style={mapStyles.like_list_header}>
                        <Text style={mapStyles.list_title}>Your Liked Trails</Text>
                      </View>
                      <View style={mapStyles.list_spacer}/>
                      <FlatList 
                      contentContainerStyle={mapStyles.like_list_content}
                      data={likedTrails}
                      renderItem={Item}>
                      </FlatList>
                    </View>
                </View>
                <View style={mapStyles.map_column}>
                    <SearchBackground/>
                </View>
                <View style={mapStyles.map_column}>
                    <NearBackground/>
                    <View style={{...mapStyles.near_menu, display: isNearMenu ? 'flex' : 'none'}}>
                      <View style={mapStyles.near_list_header}>
                        <Text style={{...mapStyles.list_title, textAlign: "right"}}>Nearby Trails</Text>
                      </View>
                      <View style={mapStyles.list_spacer}/>
                      <FlatList 
                      contentContainerStyle={mapStyles.near_list_content}
                      data={nearTrails}
                      renderItem={Item}>
                      </FlatList>
                    </View>
                </View>
            </View>
            <View style={mapStyles.map_column_container}>
                <View style={mapStyles.map_column}>
                    <TouchableOpacity onPress={likeAnimationHandler}>
                        <View style={mapStyles.like}>
                            <AntDesign name="hearto" size={36} color="white" /><Text style={defaults.white_text}>LIKED</Text>
                        </View>
                    </TouchableOpacity>
                </View>
                <View style={mapStyles.map_column}>
                    <TouchableOpacity onPress={searchAnimationHandler}>
                        <View style={mapStyles.search}>
                            <AntDesign name="search1" size={36} color="white" /><Text style={defaults.white_text}>SEARCH</Text>
                        </View>
                    </TouchableOpacity>
                </View>
                <View style={mapStyles.map_column}>
                    <TouchableOpacity onPress={nearAnimationHandler}>
                        <View style={mapStyles.near}>
                            <Octicons name="location" size={36} color="white" /><Text style={defaults.white_text}>NEAR</Text>
                        </View>
                    </TouchableOpacity>
                </View>
            </View>
        </View>
      </View>
    )
}
