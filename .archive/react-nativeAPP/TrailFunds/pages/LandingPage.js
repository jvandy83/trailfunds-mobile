import React from 'react';
import { Button, View, Text, TouchableOpacity, TextInput, StyleSheet, ImageBackground, Image, ScrollView, Alert, Dimensions } from 'react-native';
import defaultSty from '../style/defaultSty';
import SecondaryButton from '../style/secondButt';
import GreenTextButt from '../style/greenTextButt';

function LandingPage({ navigation }) {
    return (
        <ScrollView style={{marginBottom:30}}>
            <ImageBackground source={require('../assets/GJfromMonu.png')}
                style={defaultSty.image}>
                <View style={defaultSty.overlay}>
                    <Text style={LandPageStyles.loved2Death}>
                        Your Trails are being loved to 
                        <Text style={LandPageStyles.DeathLife}> DEATH</Text>
                    </Text>
                    <Text style={LandPageStyles.Help2Life}>
                        Help Us bring them back to 
                        <Text style={LandPageStyles.DeathLife}> LIFE</Text>
                    </Text>
                </View>
            </ImageBackground>
            <Text style={defaultSty.darkTextHead}>
                Supporting Just Became Easy
            </Text>
            <Text style={[defaultSty.subHeadText, {fontSize: 18}]}>
            Here at Trail Funds, we want to make it easier to LOVE or trails. Help us support your local trails!
            </Text>
            <View style={[defaultSty.greenBackGround, LandPageStyles.centerTheThings, {paddingTop:25,paddingBottom:25}]}>
            <SecondaryButton
                text= 'Donate'
                onPress={() => navigation.navigate('Donate')}
            />
            </View>
            <View
                style={{
                    alignSelf:'center',
                    paddingTop: 60,
                    width: '75%',
                    borderBottomColor:'black',
                    borderBottomWidth: 2,
                }}
            />
            <Text style={[{paddingTop: 35,textAlign:'center'},defaultSty.basicBlackText]}>
                Because Of People Like You,
            </Text>
            <View style={[{alignItems:'center',justifyContent:'center'},LandPageStyles.row]}>
                <Text style={[defaultSty.basicBlackText, {textAlign:'center'}]}>
                    We Have Raised:
                </Text>
                <Text style={{
                    color: '#59C092',
                    fontSize: 44,
                    fontWeight: 'bold',
                    }}>$76,832</Text>
            </View>
            <Text style={defaultSty.subHeadText}>
                We have been able to fund and care for more than 873 trails and 80 trail builders
            </Text>
            <GreenTextButt
                text = "Learn More"
                onPress={() => Alert.alert('Change style to green, and redirect to learn more page')}
            />
            <View
                style={{
                    alignSelf:'center',
                    paddingTop: 20,
                    marginBottom: 60,
                    width: '75%',
                    borderBottomColor:'black',
                    borderBottomWidth: 2,
                }}
            />
            <View style={{backgroundColor: '#1C2126', paddingBottom:20}}>
                <Text style={[defaultSty.basicWhiteHeader,{marginLeft: 28, paddingTop: 25, fontWeight: 'bold',}]}>
                    Special thanks to:
                </Text>
                <View style={[LandPageStyles.row, {alignItems:'center',justifyContent:'center'}]}>
                    <View style={LandPageStyles.column}>
                        <Image source={require('../assets/logo.png')}
                        style={LandPageStyles.sponsorsPhotos} />
                        <Text style={LandPageStyles.sponsorsNames}>REI</Text>
                    </View>
                    <View style={LandPageStyles.column}>
                        <Image source={require('../assets/logo.png')}
                        style={LandPageStyles.sponsorsPhotos} />
                        <Text style={LandPageStyles.sponsorsNames}>Strava</Text>
                    </View>
                </View>
                <View style={[LandPageStyles.row, {alignItems:'center',justifyContent:'center'}]}>
                    <View style={LandPageStyles.column}>
                        <Image source={require('../assets/logo.png')}
                        style={LandPageStyles.sponsorsPhotos} />
                        <Text style={LandPageStyles.sponsorsNames}>All Trails</Text>
                    </View>
                    <View style={LandPageStyles.column}>
                        <Image source={require('../assets/logo.png')}
                        style={LandPageStyles.sponsorsPhotos} />
                        <Text style={LandPageStyles.sponsorsNames}>COPMOBA</Text>
                    </View>
                </View>
                <GreenTextButt
                    text = "Learn More"
                    onPress={() => Alert.alert('Change style to green, and redirect to learn more page')}
                />
            </View>
            <View style={{backgroundColor: '#59C092',alignItems:'center',justifyContent:'center'}}>
                <View
                    style={{
                        alignSelf:'center',
                        paddingTop: 35,
                        marginBottom: 20,
                        width: '75%',
                        borderBottomColor:'black',
                        borderBottomWidth: 2,
                    }}
                />
                <Text style={defaultSty.basicBlackText}>
                    Support a trail near you!
                </Text>
                <SecondaryButton
                    text = 'Donate'
                    onPress={() => navigation.navigate('Donate')}
                />
                <View
                    style={{
                        alignSelf:'center',
                        paddingTop: 20,
                        width: '75%',
                        borderBottomColor:'black',
                        borderBottomWidth: 2,
                    }}
                />
                <View style={[LandPageStyles.row, {paddingTop: 15}]}>
                    <Text style={[defaultSty.legalText, {textAlign:'center'}]}>
                    We create efficiency and new revenue streams for Trail Maintenance Orgs. In exchange for 10% of your donation, we provide them with a team and platform so they can focus on hard work of trails.
                    </Text>
                </View>
                <View
                    style={{
                        alignSelf:'center',
                        paddingTop: 20,
                        marginBottom: 20,
                        width: '75%',
                        borderBottomColor:'black',
                        borderBottomWidth: 2,
                    }}
                />
            </View>
            <View style={{backgroundColor: '#59C092'}}>
                <Text style={[defaultSty.basicWhiteHeader,{marginLeft: 28, paddingTop: 25, fontWeight: 'bold', textAlign:'left'}]}>
                    Trail Funds
                </Text>
                <Text style={[defaultSty.basicBlackText, {marginLeft: 28}]}>
                    Copyright ©
                </Text>
            </View>
        </ScrollView>
    )
}

const windowHight = Dimensions.get('window').height
const windowWidth = Dimensions.get('window').width              //used in sponsorsPhotos made photos dynamic to phone screens

const LandPageStyles = StyleSheet.create({
    loved2Death: {
        paddingTop: 25,
        color: '#1C2126',
        fontSize: 30,
        marginLeft: 28,
        marginRight: 37,
        fontWeight: 'bold',
    },
    DeathLife: {
        color: '#59C092',
        fontSize: 30,
    },
    Help2Life: {
        paddingBottom: 25,
        color: '#1C2126',
        fontSize: 30,
        textAlign: 'right',
        marginRight: 28,
        marginLeft: 37,
        fontWeight: 'bold',
    },
    centerTheThings: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'space-between',
    },
    row: {
        flexDirection: 'row',
        alignItems: 'center',
    },
    column:{
        flexDirection: 'column',
        alignItems: 'center',
    },
    sponsorsPhotos: {
        height:(windowWidth/3),
        width:(windowWidth/3),
        borderRadius: 1000,
        marginLeft: 20,
        marginRight: 20,
        marginTop: 20,
        marginBottom:10,
    },
    sponsorsNames:{
        color: '#59C092',
        fontSize: 22,
        fontWeight: 'bold',
        paddingBottom: 20,
    },
})

export default LandingPage;