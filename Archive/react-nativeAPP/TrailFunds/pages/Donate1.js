import * as React from '@react-navigation/native';
import { Button, View, Text, TouchableOpacity, TextInput, StyleSheet, KeyboardAvoidingView, Platform, Dimensions } from 'react-native';
import defaultSty from '../style/defaultSty'
import PrimaryButton from '../style/primeButt';

function DonatePage({ navigation }) {
    return(
        <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
        style = {defaultSty.container}>
            <Text style={[defaultSty.loved2Death, {marginVertical: 10}]}>
                Step 1
            </Text>
            <Text style={[defaultSty.basicBlackText, {marginBottom: 5}]}>
                Pick your favorite Trail Org
            </Text>
            <TextInput
                style={[defaultSty.inputLong, {paddingHorizontal:15, marginVertical: 10}]}
                placeholder='Name of Trail Org or Trail Name'
                placeholderTextColor={'#777777'}
            />
            <Text style={[defaultSty.basicBlackText]}>
                OR
            </Text>
            <TextInput
                style={[defaultSty.inputLong, {}]}
                placeholder = 'City'
                placeholderTextColor = {'#777777'}
            />
            <View style={[defaultSty.row]}>
                <TextInput
                    style={[defaultSty.inputShort, {}]}
                    placeholder = 'Zip'
                    keyboardType="number-pad"
                    placeholderTextColor = {'#777777'}
                />
                <TextInput
                    style={[defaultSty.inputShort]}
                    placeholder = 'State'
                    placeholderTextColor = {'#777777'}
                />
            </View>
            <PrimaryButton
                text = 'Next'
                onPress={() => navigation.navigate('Donate2')}
            />
        </KeyboardAvoidingView>
    )
}

const windowWidth = Dimensions.get('window').width

export default DonatePage;