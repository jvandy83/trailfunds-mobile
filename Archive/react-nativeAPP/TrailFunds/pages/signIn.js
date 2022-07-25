import { Button, View, Text, TouchableOpacity, StyleSheet,  Alert, TextInput, KeyboardAvoidingView, Platform, Keyboard, TouchableWithoutFeedback } from 'react-native';
import defaultSty from '../style/defaultSty'
import PrimaryButton from '../style/primeButt';
import GreenTextButt from '../style/greenTextButt';
import { React, useState } from 'react'

function SignIn({ navigation }) {

    navigateToScreen=()=>{
        navigation.navigate('Third')
    }
    const [fName, setFName] = useState("");
    const [lName, setLName] = useState("");
    const [email, setEmail] = useState("");
    const [password, setPass] = useState("");
    const [confPass, setConfPass] = useState("");

    var Value = fName;
    var Value2 = lName;
    var Value3 = email;
    var Value4 = password;
    var Value5 = confPass

    
    return(
        <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
        style={defaultSty.container}>

        <Text style={defaultSty.blackHead2}>
            Sign In
        </Text>

        <Text style={defaultSty.basicBlackText}>
            Don't have an account?
        </Text>

        <GreenTextButt //This will be the default button and the OS of the system will make it there own
            text = "Create an account"
            onPress={() => navigation.navigate('signUp')}
        />

        <TextInput                                                  //phone # text box
            style={[defaultSty.inputLong, {paddingHorizontal:15, marginVertical: 10}]}
            placeholderTextColor={'#777777'}
            keyboardType='email-address'
            placeholder='E-Mail'
            autoCapitalize = 'none'
            value = {email}
            onChangeText={(email) => {setEmail(email)}}
        />

        <TextInput                                                  //password text box
            style={[defaultSty.inputLong, {paddingHorizontal:15, marginVertical: 10}]}
            placeholderTextColor={'#777777'}
            keyboardType='default'
            placeholder='Password'
            value = {password}
            secureTextEntry
            onChangeText={(password) => {setPass(password)}}
        />

        <TextInput                                                  //password text box
            style={[defaultSty.inputLong, {paddingHorizontal:15, marginVertical: 10}]}
            placeholderTextColor={'#777777'}
            keyboardType='default'
            placeholder='Confirm Password'
            value = {confPass}
            secureTextEntry
            onChangeText={(confPass) => {setConfPass(confPass)}}
        />

        <GreenTextButt //This will be the default button and the OS of the system will make it there own
            text = "Forgot Password?"
            onPress={() => navigation.navigate('ForgotPassword')}
        />



        <PrimaryButton //This is our styled green button that will act as the donate button. This is calling the Style made in the 'externStyle.js' file
            text = 'Submit'
            onPress={() => {
                if (Value5 === Value4)
                {
                    Alert.alert('complete')
                }
                else (Alert.alert('Passwords do not match'))
              }}   
        />

        <Text style={defaultSty.basicBlackText}>
            Or sign up with
            

        </Text>

        <Text style={defaultSty.basicBlackText}>
            Put Apple, google, facebook and office 365 logos
        
            

        </Text>
          
        </KeyboardAvoidingView>
    )

    



}


export default SignIn;
