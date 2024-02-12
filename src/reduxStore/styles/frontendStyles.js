//Here you will find the style for the primary button that we use for 'DONATE'

import React from "react";
import { StyleSheet, TouchableOpacity, Text, View } from "react-native";

import { AntDesign } from "@expo/vector-icons";

export const defaults = StyleSheet.create({
  container: {
    //This is the style that is added to every page
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  greenTextHead: {
    color: "#59C092",
    fontSize: 40,
    fontWeight: "bold",
  },
  blackLargeText: {
    color: "Black",
    fontSize: 40,
  },
  white_text: {
    color: "white",
    marginTop: 5,
  },
  background: {
    width: "100%",
    height: "100%",
    alignItems: "center",
    justifyContent: "center",
  },
  primary_bubble: {
    width: 66,
    height: 66,
    borderRadius: 33,
    borderWidth: 2,
    top: 0,
    bottom: 0,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#59C092",
  },
  secondary_bubble: {
    width: 44,
    height: 44,
    borderRadius: 22,
    borderWidth: 2,
    top: 0,
    bottom: 0,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#1C2126",
  },
  column_container: {
    flexDirection: "row",
    borderWidth: 2,
    borderBottomRightRadius: 50,
    borderBottomLeftRadius: 50,
    borderTopRightRadius: 10,
    borderTopLeftRadius: 10,
  },
  column: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    textAlign: "center",
    paddingTop: 5,
    paddingBottom: 10,
    //borderWidth: 1,
  },
});

export function PrimaryButton({ text, onPress, color, disabled }) {
  const textColor = color || "black";
  return (
    <TouchableOpacity disabled={disabled || false} onPress={onPress}>
      <View
        style={StyleSheet.create({
          borderRadius: 100,
          paddingVertical: 14,
          top: 0.5,
          margin: 10,
          maxWidth: "80%",
          width: 271,
          height: 48,
          backgroundColor: "#59C092",
          opacity: disabled ? 0.6 : 1,
        })}
      >
        <Text
          style={StyleSheet.create({
            color: textColor,
            fontWeight: "bold",
            textTransform: "uppercase",
            fontSize: 16,
            textAlign: "center",
          })}
        >
          {" "}
          {text}
        </Text>
      </View>
    </TouchableOpacity>
  );
}

export function SecondaryButton({
  text,
  onPress,
  color = "white",
  backgroundColor = "#1C2126",
  disabled = false,
}) {
  return (
    <TouchableOpacity onPress={onPress} disabled={disabled}>
      <View
        style={StyleSheet.create({
          borderRadius: 100,
          paddingVertical: 14,
          top: 0.5,
          bottom: 0.5,
          margin: 5,
          width: 223,
          height: 48,
          backgroundColor,
          opacity: disabled ? 0.7 : 1,
        })}
      >
        <Text
          style={StyleSheet.create({
            color: color,
            fontWeight: "bold",
            textTransform: "uppercase",
            fontSize: 16,
            textAlign: "center",
          })}
        >
          {" "}
          {text}
        </Text>
      </View>
    </TouchableOpacity>
  );
}

export function CirclePicture({}) {
  return (
    <View
      style={StyleSheet.create({
        justifyContent: "center",
        alignItems: "center",
        backgroundColor: "white",
        height: 200,
      })}
    >
      <Image
        source={{ uri: "https://reactnative.dev/img/tiny_logo.png" }}
        style={StyleSheet.create({
          width: 200,
          height: 200,
          borderRadius: 100,
        })}
      />
    </View>
  );
}

export function IconComponent({ onPress }) {
  return (
    <TouchableOpacity onPress={onPress}>
      <View
        style={StyleSheet.create({
          justifyContent: "center",
          alignItems: "center",
          height: 43,
          width: 45,
          marginLeft: 10,
          marginRight: 5,
        })}
      >
        <AntDesign name="menuunfold" size={24} color="black" />
      </View>
    </TouchableOpacity>
  );
}
