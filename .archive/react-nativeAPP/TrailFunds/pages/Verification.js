import { Text, View, Button, Alert, StyleSheet, TextInput, KeyboardAvoidingView, Platform, Keyboard, TouchableWithoutFeedback } from 'react-native';
import { React, useState } from 'react'
//Text styles
import defaultSty from '../style/defaultSty';
//button styles
import PrimaryButton from '../style/primeButt';
import SecondaryButton from '../style/secondButt';
import HollowButton from '../style/hollowButt';
import GreenTextButton from '../style/greenTextButt';

function Verification({ navigation }) {
    navigateToScreen=()=>{
        navigation.navigate('sixth')
    }
    const [name, setName] = useState("");
    return(
        <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
        style={defaultSty.container}>
            <Text style={defaultSty.blackHead1}>
                Verification Sent!
            </Text>
            <Text style={defaultSty.blackHead2}>
                <GreenTextButton
                text = 'Send Verification Again'
                onPress={() => Alert.alert('Resent Verification Code')}
                />
            </Text>
            <TextInput                                                  //Name Text Box
                style={defaultSty.inputLong}
                placeholderTextColor={'#777777'}
                placeholder='Verification Code'
                autoCapitalize='none'
            />
            <PrimaryButton //This is our styled green button that will act as the donate button. This is calling the Style made in the 'externStyle.js' file
                text = 'Next'
                onPress={() => navigation.navigate('PasswordReset')}
            />
        </KeyboardAvoidingView>
    );
}

export default Verification;