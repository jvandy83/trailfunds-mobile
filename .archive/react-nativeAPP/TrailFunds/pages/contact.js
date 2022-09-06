import { KeyboardAvoidingView, Button, View, Text, TouchableOpacity, TextInput, StyleSheet, Alert } from 'react-native';
import defaultSty from '../style/defaultSty'
import PrimaryButton from '../style/primeButt';
import { React, useState } from 'react'


function Contact({ navigation }) {
    navigateToScreen=()=>{
        navigation.navigate('Third')
    }
    const [Name, setName] = useState("");
  

    
    return(
        <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
        style={defaultSty.container}>

        <Text style={defaultSty.darkTextHead}>
            Get in Touch
        </Text>
            
        <TextInput                                                  //Name Text Box
            style={[defaultSty.inputLong, {paddingHorizontal:15, marginVertical: 10}]}
            placeholder='Name'
            placeholderTextColor={'#777777'}
            value = {Name}
            onChangeText={(Name) => {setName(Name)}}
        />

        <TextInput                                                  //phone # text box
            style={[defaultSty.inputLong, {paddingHorizontal:15, marginVertical: 10}]}
            placeholderTextColor={'#777777'}
            keyboardType='email-address'
            placeholder='E-Mail'
            autoCapitalize = 'none'
        />

        <TextInput                                                  //phone # text box
            style={[defaultSty.inputLong, {paddingHorizontal:15, marginVertical: 10}]}
            placeholderTextColor={'#777777'}
            placeholder='Question/Comment/Concern in 100 words or less'
            multiline= { true } // need to add maxlength; it was meessing with Android, but works on IOS
            
        /> 

        <PrimaryButton //This is our styled green button that will act as the donate button. This is calling the Style made in the 'externStyle.js' file
            text = 'Send'
            onPress={() => {
                Alert.alert('sent!')
               
              }}   
        />

        </KeyboardAvoidingView>
    )
}

export default Contact;