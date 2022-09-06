import { Text, View, Button, Alert, StyleSheet, TextInput, KeyboardAvoidingView, Platform, Keyboard, TouchableWithoutFeedback } from 'react-native';
import { React, useState } from 'react'
//Text styles
import defaultSty from '../style/defaultSty';
//button styles
import PrimaryButton from '../style/primeButt';
import SecondaryButton from '../style/secondButt';
import HollowButton from '../style/hollowButt';

function TestPage({ navigation }) {
    navigateToScreen=()=>{
        navigation.navigate('fifth')
    }
    const [name, setName] = useState("");
    return(
        <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
        style={defaultSty.container}>
            <TextInput                                                  //Name Text Box
                style={defaultSty.inputLong} 
                placeholder='Name here plz'
                placeholderTextColor={'#777777'}
                onSubmitEditing={(value) => setName(value.nativeEvent.text)}
            />
            <TextInput                                                  //Email text box
                style={defaultSty.inputLong}
                placeholderTextColor={'#777777'}
                keyboardType='email-address'
                placeholder='Email address'
                autoCapitalize='none'
            />
            <TextInput                                                  //phone # text box
                style={defaultSty.inputLong}
                placeholderTextColor={'#777777'}
                keyboardType='number-pad'
                placeholder='Phone Number'
                maxLength={10}
            />
            <TextInput                                                  //password text box
                style={defaultSty.inputLong}
                placeholderTextColor={'#777777'}
                keyboardType='default'
                placeholder='Password'
                secureTextEntry
            />
            <TextInput
                style={defaultSty.inputShort}
                placeholderTextColor={'#777777'}
                keyboardType='number-pad'
                placeholder='Zip'
            />
            <Text>Welcome: {name}</Text>
        </KeyboardAvoidingView>
    );
}

export default TestPage;