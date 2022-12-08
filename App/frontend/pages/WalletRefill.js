
import React, {useState, useEffect} from 'react';
import { StyleSheet, View, Text } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { LinearGradient } from 'expo-linear-gradient'
import { TouchableOpacity } from 'react-native-gesture-handler';


let STORAGE_KEY = '@user_input';

const WalletRefills = ({navigation}) => {
    const [input, setInput] = useState();

    useEffect(() => {
      readData();      
      },[]);
    
  
    const saveData = async (value) => {
      try {
        let temp = value.toString();
        await AsyncStorage.setItem(STORAGE_KEY, temp)
        alert('Data successfully saved')
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

    const addFunds = async (value) => {
      let temp = parseInt(input) + value
      saveData(temp)
      setInput(temp);
    };
    
    return (
      <LinearGradient colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']} style={profile.background}>
        <View style={refill.container}>
          <View style={refill.panel}>
          <Text style={refill.title}>{input}</Text>
          <Text style={refill.text}>Add to your wallet</Text>
          <TouchableOpacity onPress={() => {
            addFunds(3);
            navigation.navigate("My Wallet");
            }} style={refill.button}>
            <Text style={refill.buttonText}>$3</Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={() => { 
            addFunds(5);
            navigation.navigate("My Wallet");
            }} style={refill.button}>
            <Text style={refill.buttonText}>$5</Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={() => { addFunds(10)
            navigation.navigate("My Wallet");
            }} style={refill.button}>
            <Text style={refill.buttonText}>$10</Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={readData} style={refill.button}>
            <Text style={refill.buttonText}>Show</Text>
          </TouchableOpacity>
          </View>
        </View>
      </LinearGradient>
    );
  
  };
  
  const refill = StyleSheet.create({
    container: {
      paddingTop: "25%",
      flex: 1,
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
      alignSelf: 'center',
    },
    panel: {
      paddingTop: 10,
      paddingHorizontal: 10,
    },
    label: {
      fontSize: 20,
    },
    text: {
      alignSelf: 'center',
      fontSize: 24,
      paddingTop: 50,
      paddingBottom: 10,
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
      margin: 10,
      padding: 10,
      backgroundColor: '#59C092',
      justifyContent: 'center',
      alignItems: 'center',
      borderRadius: 4,
    },
    buttonText: {
      fontSize: 18,
      color: '#444',
    },
  });
  
export default WalletRefills;