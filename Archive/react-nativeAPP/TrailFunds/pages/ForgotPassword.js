import { Text, View, Button, Alert, StyleSheet, TextInput, KeyboardAvoidingView, Platform, Keyboard, TouchableWithoutFeedback } from 'react-native';
import { React, useState } from 'react'
//Text styles
import defaultSty from '../style/defaultSty';
//button styles
import PrimaryButton from '../style/primeButt';
import SecondaryButton from '../style/secondButt';
import HollowButton from '../style/hollowButt';

function ForgotPassword({ navigation }) {
    navigateToScreen=()=>{
        navigation.navigate('sixth')
    }
    const [name, setName] = useState("");
    return(
        <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
        style={defaultSty.container}>
            <Text style={defaultSty.blackHead1}>
                Forgot Password?
            </Text>
            <TextInput                                                  //Name Text Box
                style={[defaultSty.inputLong, {paddingHorizontal:15, marginVertical: 10}]}
                placeholderTextColor={'#777777'}
                keyboardType='email-address'
                placeholder='Enter Email Address'
                autoCapitalize='none'
            />
            <TextInput                                                  //Email text box
                style={[defaultSty.inputLong, {paddingHorizontal:15, marginVertical: 10}]}
                placeholderTextColor={'#777777'}
                keyboardType='email-address'
                placeholder='Re Enter Email Address'
                autoCapitalize='none'
            />
            <PrimaryButton //This is our styled green button that will act as the donate button. This is calling the Style made in the 'externStyle.js' file
                text = 'Send Verification Code'
                onPress={() => navigation.navigate('Verification')}
            />
        </KeyboardAvoidingView>
    );
}

export default ForgotPassword;