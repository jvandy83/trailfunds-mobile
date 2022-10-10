//Here you will find the style for the primary button that we use for 'DONATE'

import react from "react";
import { StyleSheet, TouchableOpacity, Text, View} from "react-native";
import { backgroundColor } from "react-native/Libraries/Components/View/ReactNativeStyleAttributes";

export const defaults = StyleSheet.create({
    container: {
      //This is the style that is added to every page
      flex: 1,
      backgroundColor: "#fff",
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
  });

export function PrimaryButton({ text, onPress }){
    return (
        <TouchableOpacity onPress={onPress}>
            <View style={StyleSheet.create({    
                borderRadius: 100,
                paddingVertical: 14,
                top: 0.5,
                margin: 10,
                width: 271,
                height: 48,
                backgroundColor: '#59C092',
                })}>
                <Text style={StyleSheet.create({
                    color: 'black',
                    fontWeight: 'bold',
                    textTransform: 'uppercase',
                    fontSize: 16,
                    textAlign: 'center',
                })}> { text }</Text>
            </View>
        </TouchableOpacity>
    )
}

export function SecondaryButton({ text, onPress }){
    return (
        <TouchableOpacity onPress={onPress}>
            <View style={StyleSheet.create({    
                borderRadius: 100,
                paddingVertical: 14,
                top:0.5,
                bottom:0.5,
                margin: 10,
                width: 223,
                height: 48,
                backgroundColor: '#1C2126',
                })}>
                <Text style={StyleSheet.create({
                    color: 'white',
                    fontWeight: 'bold',
                    textTransform: 'uppercase',
                    fontSize: 16,
                    textAlign: 'center',
                })}> { text }</Text>
            </View>
        </TouchableOpacity>
    )
}

export function CirclePicture({ }){
    return (
      <View style={StyleSheet.create({
            justifyContent: 'center',
            alignItems: 'center',
            backgroundColor: 'white',
            height: 200,
            })}>
            <Image source={require('../assets/icon.png')} style={StyleSheet.create({
                width: 200,
                height: 200,
                borderRadius: 200 / 2,
            })}/>
      </View>
    );
  };