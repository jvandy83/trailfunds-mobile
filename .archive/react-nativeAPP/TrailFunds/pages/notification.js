import { Text, View, Button, Alert, StyleSheet, TextInput, KeyboardAvoidingView, Platform, Keyboard, TouchableWithoutFeedback, Image } from 'react-native';
import { React, useState } from 'react'
//Text styles
import defaultSty from '../style/defaultSty';
//button styles
import PrimaryButton from '../style/primeButt';
import SecondaryButton from '../style/secondButt';
import HollowButton from '../style/hollowButt';
import CirclePicture from '../style/circlePic';

function Notification({ route, navigation }) {
    // navigateToScreen=()=>{
    //     navigation.navigate('sixth')
    // }
    const {trailName, trailData} = route.params;
    const [name, setName] = useState("");
    return(
        <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
        style={defaultSty.container}>
            <CirclePicture>
                
            </CirclePicture>
            <Text style={defaultSty.head1}>
                {trailName}
            </Text>
            <Text style={defaultSty.basicBlackText}>
                Trail Org: COPMOBA
            </Text>
            <Text style={defaultSty.blackHead3}>
                Payment Method:
            </Text>
            <Text style={defaultSty.blackHead3}>
                ApplePay Logo
            </Text>
            <PrimaryButton 
                text = 'Donate 99¢'
                onPress={() => alert('No dest')}
            />
            <PrimaryButton 
                text = 'Change Amount'
                onPress={() => alert('No dest')}
            />
            <SecondaryButton
                text = 'Learn More'
                onPress={() => alert('No dest')}
            />

        </KeyboardAvoidingView>
    );
}

export default Notification;