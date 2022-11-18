import React, { useRef, useState, useEffect } from 'react';
import { StyleSheet, TouchableOpacity, Animated, Text, View } from 'react-native';

export const mapStyles = StyleSheet.create({
    heart: {
        width: 80,
        height: 80,
        backgroundColor: "#C05987",
        borderRadius: 40,
        flex: 0,
        justifyContent: "center",
        alignItems: "center",
        flexDirection: "column",
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
    },
    likeStyles: {
        borderRadius: 100, 
        backgroundColor: "red", 
        flex: 0, 
        alignContent: "center", 
        alignItems: "center", 
        justifyContent: "center", 
        opacity: 0.8,
        position: "absolute",
        bottom: 0,
        top: 0,
        left: 0,
        right: 0,
        // zIndex: -10,
        // elevation: -10,
    },
    column: {
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
        textAlign: "center",
        paddingTop: 5,
        paddingBottom: 10,
    },
    container: {
      flexDirection: "row",
    },
    container2: {
      position: "absolute",
      top: "80%",
      flexDirection: "row",     
    },
    temp: {
      width: "100%",
      height: "80%",
      backgroundColor: "grey"
    },
  });

export default function MapContainer() {
  const [isLiked, setLiked] = useState(false);
  const [isSearch, setSearch] = useState(false);
  const [isNear, setNear] = useState(false);

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

  useEffect(() => {
    console.log('isLiked:', isLiked, '- isSearch:', isSearch, '- isNear:', isNear);
  }, [isLiked, isSearch, isNear]);

  //const [scale, setScale] = useState(0);
  const likeScale = useRef(new Animated.Value(0)).current;
  const searchScale = useRef(new Animated.Value(0)).current;
  const nearScale = useRef(new Animated.Value(0)).current;
  
  useEffect(() => {
    Animated.timing (
      likeScale,
      {
        toValue: isLiked ? 10 : 0,
        duration: 500,
        useNativeDriver: false
      },
    ).start()
  });

  useEffect(() => {
    Animated.timing (
      searchScale,
      {
        toValue: isSearch ? 10 : 0,
        duration: 500,
        useNativeDriver: false
      },
    ).start()
  });

  useEffect(() => {
    Animated.timing (
      nearScale,
      {
        toValue: isNear ? 10 : 0,
        duration: 500,
        useNativeDriver: false
      }
    ).start()
  });

  const LikeMenu  = (props) => {
    return (
      <Animated.View
        style={{
          width: 75,
          height: 75,
          // left: 100,
          borderRadius: "100%",
          backgroundColor: 'pink',
          transform: [{ scale: likeScale }],
        }}>
        {props.children}
      </Animated.View>
    );
  };

  const SearchMenu  = (props) => {
    return (
      <Animated.View
        style={{
          width: 75,
          height: 75,
          // left: 100,
          borderRadius: "100%",
          backgroundColor: 'green',
          transform: [{ scale: searchScale }],
        }}>
        {props.children}
      </Animated.View>
    );
  };

  const NearMenu  = (props) => {
    return (
      <Animated.View
        style={{
          width: 75,
          height: 75,
          // left: 100,
          borderRadius: "100%",
          backgroundColor: 'blue',
          transform: [{ scale: nearScale }],
        }}>
        {props.children}
      </Animated.View>
    );
  };

  return (
    <View>

        <View style={mapStyles.temp}/>

        <View style={mapStyles.container2}>
            <View style={mapStyles.column}>
                <LikeMenu/>
            </View>
            <View style={mapStyles.column}>
                <SearchMenu/>
            </View>
            <View style={mapStyles.column}>
                <NearMenu/>
            </View>
        </View>
        <View style={mapStyles.container}>
            <View style={mapStyles.column} >
                <TouchableOpacity onPress={toggleLiked}>
                    <View style={mapStyles.heart}>
                        <AntDesign name="hearto" size={36} color="white" /><Text style={defaults.white_text}>LIKED</Text>
                    </View>
                </TouchableOpacity>
            </View>
            <View style={mapStyles.column} >
                <TouchableOpacity onPress={toggleSearch}>
                    <View style={mapStyles.search}>
                        <AntDesign name="search1" size={36} color="white" /><Text style={defaults.white_text}>SEARCH</Text>
                    </View>
                </TouchableOpacity>
            </View>
            <View style={mapStyles.column} >
                <TouchableOpacity onPress={toggleNear}>
                    <View style={mapStyles.near}>
                        <Octicons name="location" size={36} color="white" /><Text style={defaults.white_text}>NEAR</Text>
                    </View>
                </TouchableOpacity>
            </View>
        </View>
    </View>
)}