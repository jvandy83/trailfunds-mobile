
import { StatusBar } from "expo-status-bar";
import React, {useState, useEffect} from 'react';
import {
  StyleSheet,
  View,
  Text,
  TextInput,
  TouchableOpacity,
  Pressable
} from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';


let STORAGE_KEY = '@user_input';

const WalletRefills = ({navigation}) => {
    const [input, setInput] = useState();
    const [isLoaded, setIsLoaded] = useState(false);
    let value = 0;

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
    // ...
    return (
      <View style={styles.container}>
        <View style={styles.panel}>
        <Text style={styles.title}>
       {input}
      </Text>
          <Text style={styles.text}>Add to your wallet</Text>
  
          <Pressable onPress={() =>  
          { addFunds(3);
            navigation.navigate("Wallet Page");
            }} style={styles.button}>
            <Text style={styles.buttonText}>$3</Text>
          </Pressable>
          <Pressable onPress={() => { 
              addFunds(5);
        navigation.navigate("Wallet Page");
            }
         }style={styles.button}>
            <Text style={styles.buttonText}>$5</Text>
          </Pressable>
          <Pressable onPress={() => { addFunds(10)
            navigation.navigate("Wallet Page");}
          } style={styles.button}>
            <Text style={styles.buttonText}>$10</Text>
          </Pressable>
          <Pressable onPress={readData} style={styles.button}>
          <Text style={styles.buttonText}>Show</Text>
        </Pressable>
        </View>
      </View>
    );
  
  };
  /*
  <TextInput
  style={styles.inputField}
  value={other}
  placeholder="Other"
  onChangeText={onChangeText}
  onSubmitEditing={onSubmitEditing}
  />
  */
  
  
  const styles = StyleSheet.create({
    container: {
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