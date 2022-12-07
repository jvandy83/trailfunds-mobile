import React, { useState,useEffect}from "react";
import { StyleSheet, Text, View,  Pressable } from "react-native";
import AsyncStorage from '@react-native-async-storage/async-storage';
import { PrimaryButton } from "../styles/frontendStyles";
let STORAGE_KEY = '@user_input';

const WalletPage = ({ navigation }) => {
  const [input, setInput] = useState(0);
  const[isEmpty, setIsEmpty] = useState(true);
  const name = 'John Doe';

  useEffect(() => {
    if (input == 0) {
      alert(input + 'weee');
    } else {alert((input))};
  }, [input]);

  const saveData = async (value) => {
    let temp = value.toString();
    try {
      await AsyncStorage.setItem(STORAGE_KEY, temp)
      alert(temp);
      //alert('Data successfully saved')
    } catch (e) {
      alert('Failed to save the data to the storage')
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
  /*
  const setFunds = async (value) => {
    componentDidUpdate(input);
      if (value !== input) {
        alert(value);
        setInput(value);
        saveData(value);
      }
    } 
  
  */
  const setFunds = async (value) => {
    setInput(value);
    saveData(value);
    setIsEmpty(true);
  }
  
  
  
  return (
    
    <View style={styles.container}>
      <Text style={styles.label}>
        {name}'s Wallet
      </Text>
      <Text style={styles.title}>
       {isEmpty ? "$" +  input : "Uh Oh, your Out!"}
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
          navigation.navigate("Wallet Refill");
        }}
      />
     
      <Pressable onPress={readData} style={styles.button}>
          <Text style={styles.buttonText}>Show</Text>
        </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
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
  },
  panel: {
    paddingTop: 10,
    paddingHorizontal: 10,
  },
  label: {
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
  buttonText: {
    fontSize: 18,
    color: '#444',
  },
});

export default WalletPage;

