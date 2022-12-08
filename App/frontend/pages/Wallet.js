import React, { useState,useEffect}from "react";
import { StyleSheet, Text, View,  Pressable } from "react-native";
import AsyncStorage from '@react-native-async-storage/async-storage';
import { PrimaryButton } from "../styles/frontendStyles";
import { LinearGradient } from 'expo-linear-gradient'
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

const wallet = StyleSheet.create({
  container: {
    paddingTop: "30%",
    justifyContent: "top",
    flex: 1,
    alignItems: 'center'
  },
  header: {
    width: '100%',
    backgroundColor: '#dcdcdc',
    paddingTop: 48,
    paddingBottom: 10,
    borderBottomWidth: StyleSheet.hairlineWidth,
    alignItems: 'center',
  },
  title: {
    fontSize: 22,
    color: '#333',
    fontWeight: 'bold',
    paddingBottom: 50,
  },
  panel: {
    paddingTop: 10,
    paddingHorizontal: 10,
  },
  label: {
    paddingBottom: 10,
    fontSize: 20,
  },
  text: {
    fontSize: 24,
    paddingTop: 10,
  },
  inputField: {
    backgroundColor: '#fff',
    height: 44,
    borderWidth: 1,
    borderColor: '#333',
    width: '100%',
    padding: 10,
    marginTop: 12,
  },
  button: {
    borderRadius: 100,
    paddingVertical: 14,
    top:0.5,
    bottom:0.5,
    margin: 10,
    width: 223,
    height: 48,
    padding: 10,
    backgroundColor: '#59C092',
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius: 50,
  },
  secondaryButton: {
    borderRadius: 100,
    paddingVertical: 14,
    top:0.5,
    bottom:0.5,
    margin: 10,
    width: 223,
    height: 48,
    padding: 10,
    backgroundColor: 'black',
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius: 50,
  },
  buttonText: {
    fontSize: 18,
    color: '#444',
  },
});

export default WalletPage;

