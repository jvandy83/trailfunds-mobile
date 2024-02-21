import React, { useEffect, useState, useRef } from "react";
import { TouchableOpacity, Text, View, Animated, FlatList } from "react-native";

import { MaterialIcons } from "@expo/vector-icons";

// components
import { NearButton } from "@components/buttons/NearButton";
import { SearchButton } from "@components/buttons/SearchButton";
import { LikeButton } from "@components/buttons/LikeButton";
import { AnimatedButtonBackground } from "@components/layout/AnimatedButtonBackground";

import { mapStyles } from "../../reduxStore/styles/mapStyles";
import { defaults } from "../../reduxStore/styles/frontendStyles";

// TODO: Search Function

const SCALE_SIZE = 12;
const ANIMATION_DURATION = 400;

export const Map = () => {
  // local state
  const [isLiked, setLiked] = useState(false);
  const [isLikeMenu, setLikeMenu] = useState(false);
  const [isSearch, setSearch] = useState(false);
  const [isSearchMenu, setSearchMenu] = useState(false);
  const [isNear, setNear] = useState(false);
  const [isNearMenu, setNearMenu] = useState(false);
  // refs
  const likeScale = useRef(new Animated.Value(0)).current;
  const searchScale = useRef(new Animated.Value(0)).current;
  const nearScale = useRef(new Animated.Value(0)).current;
  const mapRef = useRef(null);

  // event handlers
  const handleToggleSearchMenu = () => {
    if (isSearch) {
      setLiked(false);
      setLikeMenu(false);
      setNear(false);
      setNearMenu(false);
      setSearchMenu((isSearchMenu) => !isSearchMenu);
      setSearch((isSearch) => !isSearch);
    } else {
      setLiked(false);
      setLikeMenu(false);
      setNear(false);
      setNearMenu(false);
      setSearch((isSearch) => !isSearch);
      setTimeout(() => {
        setSearchMenu((isSearchMenu) => !isSearchMenu);
      }, ANIMATION_DURATION + 200);
    }
  };

  const handleToggleLikeMenu = () => {
    if (isLiked) {
      setSearch(false);
      setSearchMenu(false);
      setNear(false);
      setNearMenu(false);
      setLikeMenu((isLikeMenu) => !isLikeMenu);
      setLiked((isLiked) => !isLiked);
    } else {
      setSearch(false);
      setSearchMenu(false);
      setNear(false);
      setNearMenu(false);
      setLiked((isLiked) => !isLiked);
      setTimeout(() => {
        setLikeMenu((isLikeMenu) => !isLikeMenu);
      }, ANIMATION_DURATION + 200);
    }
  };

  const handleToggleNearMenu = () => {
    if (isNear) {
      setLiked(false);
      setLikeMenu(false);
      setSearch(false);
      setSearchMenu(false);
      setNearMenu((isNearMenu) => !isNearMenu);
      setNear((isNear) => !isNear);
    } else {
      setLiked(false);
      setLikeMenu(false);
      setSearch(false);
      setSearchMenu(false);
      setNear((isNear) => !isNear);
      setTimeout(() => {
        setNearMenu((isNearMenu) => !isNearMenu);
      }, ANIMATION_DURATION + 200);
    }
  };
  //// end of event handlers ////

  const Item = ({ item }) => (
    <TouchableOpacity style={mapStyles.list_box}>
      <Text style={mapStyles.list_text} numberOfLines={1}>
        <MaterialIcons name="location-pin" size={22} color="white" />
        {item.name}
      </Text>
    </TouchableOpacity>
  );

  const RenderLike = () => {
    const likedTrails = [
      { name: "A Liked Trail", id: 0 },
      { name: "Some Liked Trail", id: 1 },
      { name: "Some Other Really Really Long-Named Liked Trail", id: 2 },
      { name: "A Third Liked Trail", id: 3 },
      { name: "Another Liked Trail", id: 4 },
      { name: "Yet Another Liked Trail", id: 5 },
      { name: "Yet Another Liked Trail", id: 6 },
      { name: "Yet Another Liked Trail", id: 7 },
      { name: "Yet Another Liked Trail", id: 8 },
      { name: "Yet Another Liked Trail", id: 9 },
      { name: "Yet Another Liked Trail", id: 10 },
      { name: "Yet Another Liked Trail", id: 11 },
      { name: "Yet Another Liked Trail", id: 12 },
      { name: "Yet Another Liked Trail", id: 13 },
      { name: "Yet Another Liked Trail", id: 14 },
      { name: "Yet Another Liked Trail", id: 15 },
    ];
    return (
      <View style={mapStyles.map_column}>
        <AnimatedButtonBackground backgroundColor="#a97089" scale={likeScale} />
        <View
          style={{
            ...mapStyles.like_menu,
            display: isLikeMenu ? "flex" : "none",
          }}
        >
          <View style={mapStyles.like_list_header}>
            <Text style={mapStyles.list_title}>Your Liked Trails</Text>
          </View>
          <View style={mapStyles.list_spacer} />
          <FlatList
            contentContainerStyle={mapStyles.like_list_content}
            data={likedTrails}
            renderItem={Item}
          ></FlatList>
        </View>
      </View>
    );
  };

  const RenderSearch = () => {
    ("render search menu");
    return (
      <View style={mapStyles.map_column}>
        <AnimatedButtonBackground
          backgroundColor="#71a890"
          scale={searchScale}
        />
        <View
          style={{
            ...mapStyles.search_menu,
            display: isSearchMenu ? "flex" : "none",
          }}
        >
          <View style={mapStyles.search_header}>
            <Text style={mapStyles.search_title}>Find a Trail</Text>
          </View>
          <View style={mapStyles.list_spacer} />
          <View style={mapStyles.search_container}>
            <TouchableOpacity>
              <Text style={{ color: "white" }}>Some Search Functions...</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    );
  };

  const RenderNear = () => {
    const nearTrails = [
      { name: "A Liked Trail", id: 0 },
      { name: "Some Liked Trail", id: 1 },
      { name: "Some Other Really Really Long-Named Liked Trail", id: 2 },
      { name: "A Third Liked Trail", id: 3 },
      { name: "Another Liked Trail", id: 4 },
      { name: "Yet Another Liked Trail", id: 5 },
      { name: "Yet Another Liked Trail", id: 6 },
      { name: "Yet Another Liked Trail", id: 7 },
      { name: "Yet Another Liked Trail", id: 8 },
      { name: "Yet Another Liked Trail", id: 9 },
      { name: "Yet Another Liked Trail", id: 10 },
      { name: "Yet Another Liked Trail", id: 11 },
      { name: "Yet Another Liked Trail", id: 12 },
      { name: "Yet Another Liked Trail", id: 13 },
      { name: "Yet Another Liked Trail", id: 14 },
      { name: "Yet Another Liked Trail", id: 15 },
    ];
    return (
      <View style={mapStyles.map_column}>
        <AnimatedButtonBackground backgroundColor="#726faa" scale={nearScale} />
        <View
          style={{
            ...mapStyles.near_menu,
            display: isNearMenu ? "flex" : "none",
          }}
        >
          <View style={mapStyles.near_list_header}>
            <Text style={{ ...mapStyles.list_title, textAlign: "right" }}>
              Nearby Trails
            </Text>
          </View>
          <View style={mapStyles.list_spacer} />
          <FlatList
            contentContainerStyle={mapStyles.near_list_content}
            data={nearTrails}
            renderItem={Item}
          ></FlatList>
        </View>
      </View>
    );
  };

  useEffect(() => {
    Animated.timing(likeScale, {
      toValue: isLiked ? SCALE_SIZE : 0,
      duration: ANIMATION_DURATION,
      delay: ANIMATION_DURATION / 4,
      useNativeDriver: false,
    }).start();
  }, [likeScale, isLiked]);
  useEffect(() => {
    Animated.timing(searchScale, {
      toValue: isSearch ? SCALE_SIZE : 0,
      duration: ANIMATION_DURATION,
      delay: ANIMATION_DURATION / 4,
      useNativeDriver: false,
    }).start();
  }, [searchScale, isSearch]);

  useEffect(() => {
    Animated.timing(nearScale, {
      toValue: isNear ? SCALE_SIZE : 0,
      duration: ANIMATION_DURATION,
      delay: ANIMATION_DURATION / 4,
      useNativeDriver: false,
    }).start();
  }, [nearScale, isNear]);

  return (
    <>
      <View style={mapStyles.map_column_container}>
        <RenderLike />
        <RenderSearch />
        <RenderNear />
      </View>
      <View style={mapStyles.map_column_container}>
        <LikeButton
          likeAnimationHandler={handleToggleLikeMenu}
          defaults={defaults}
          mapStyles={mapStyles}
        />
        <SearchButton
          defaults={defaults}
          mapStyles={mapStyles}
          searchAnimationHandler={handleToggleSearchMenu}
        />
        <NearButton
          nearAnimationHandler={handleToggleNearMenu}
          mapStyles={mapStyles}
          defaults={defaults}
        />
      </View>
    </>
  );
};
