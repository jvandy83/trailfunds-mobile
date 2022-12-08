import React, { useState,useEffect}from "react";
import { Text, View,  Pressable } from "react-native";
import AsyncStorage from '@react-native-async-storage/async-storage';
import { PrimaryButton } from "../styles/frontendStyles";
import { LinearGradient } from 'expo-linear-gradient';
import wallet from '../styles/walletStyles';
let STORAGE_KEY = '@user_input';

const WalletPage = ({ navigation }) => {
  const [input, setInput] = useState(0);
  const[isEmpty, setIsEmpty] = useState(true);
  const name = 'Bryan Wachs';

  useEffect(() => {
    if (input == 0) {
      alert(input);
    } else {alert((input))};
  }, [input]);

  const saveData = async (value) => {
    let temp = value.toString();
    try {
      await AsyncStorage.setItem(STORAGE_KEY, temp)
      alert(temp);
      // alert('Data successfully saved')
    } catch (e) {
      alert('Something went Wrong!\nFailed to save the data to the storage')
    }
  }

  const readData = async () => {
    await AsyncStorage.getItem(STORAGE_KEY).then(value => {
      if(value !== null) {
        value = parseInt(value)
        setInput(value);
        
      }
    })
  }
  const setFunds = async (value) => {
    setInput(value);
    saveData(value);
    setIsEmpty(true);
  }
  
  
  
  return (
    <LinearGradient colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']} style={profile.background}>
      <View style={wallet.container}>
        <Text style={wallet.label}>
          {name}' Wallet
        </Text>
        <Text style={wallet.title}>
        {isEmpty ? "$" +  input : "Oops, You're Out of Trail Bucks!"}
        </Text>
        <PrimaryButton
          text = {isEmpty ? "Donate" : "All Out!"}
          onPress={() => {
            
            setInput(0);
            setFunds(0);
          }}
        />
        <PrimaryButton
          text={isEmpty ? "Add Funds" : "Refill"}
          onPress={
            () => {
            navigation.navigate("Refill Wallet");
          }}
        />
      
        <Pressable onPress={readData} style={wallet.secondaryButton}>
            <Text style={[wallet.buttonText, {color: "white"}]}>Show</Text>
          </Pressable>
      </View>
    </LinearGradient>
  );
}

export default WalletPage;

