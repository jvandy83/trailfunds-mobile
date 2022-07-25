import { Text, View, Button, Alert, StyleSheet, TextInput, KeyboardAvoidingView, Platform, Keyboard, TouchableWithoutFeedback } from 'react-native';
import { React, useState } from 'react'
//Text styles
import defaultSty from '../style/defaultSty';
//button styles
import PrimaryButton from '../style/primeButt';
import SecondaryButton from '../style/secondButt';
import HollowButton from '../style/hollowButt';

function ResetPassword({ navigation }) {
    navigateToScreen=()=>{
        navigation.navigate('sixth')
    }
    const [password, setPass] = useState("");
    const [confPass, setConfPass] = useState("");

    var Value4 = password;
    var Value5 = confPass


    return(
        <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
        style={defaultSty.container}>
            <Text style={defaultSty.blackHead}>
                Reset Password
            </Text>
           

        <TextInput                                                  //password text box
            style={defaultSty.inputLong}
            placeholderTextColor={'#777777'}
            keyboardType='default'
            placeholder='Password'
            value = {password}
            secureTextEntry
            onChangeText={(password) => {setPass(password)}}
        />

        <TextInput                                                  //password text box
            style={defaultSty.inputLong}
            placeholderTextColor={'#777777'}
            keyboardType='default'
            placeholder='Confirm Password'
            value = {confPass}
            secureTextEntry
            onChangeText={(confPass) => {setConfPass(confPass)}}
        />



        <PrimaryButton //This is our styled green button that will act as the donate button. This is calling the Style made in the 'externStyle.js' file
            text = 'Sign In'
            onPress={() => {
                if (Value5 === Value4)
                {
                    Alert.alert('complete')
                }
                else (Alert.alert('Passwords do not match'))
              }}   
        />
        </KeyboardAvoidingView>
    );
}

export default ResetPassword;