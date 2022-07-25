import { useState, useEffect, useRef } from 'react';
import { Alert, Text, View, StyleSheet } from 'react-native';
import * as Location from 'expo-location';
import MapView, { Circle, Marker, PROVIDER_GOOGLE  } from 'react-native-maps';
import defaultSty from '../style/defaultSty'
import PrimaryButton from '../style/primeButt';
import * as TaskManager from 'expo-task-manager';
import * as React from '@react-navigation/native';
import * as Device from 'expo-device';
import * as Notifications from 'expo-notifications';

const TrailData = require('../assets/TrailData'); // bring in the trail head data

let inGeofence = false
let region = [
  {identifier:TrailData.features[0].properties.Name, 
  latitude: TrailData.features[0].geometry.coordinates[1], 
  longitude: TrailData.features[0].geometry.coordinates[0], 
  radius:1}]


function _changeTrail(trailName) {
  selectedTrail = trailName
}

const GEOFENCE = "LOCATION_GEOFENCE"

Notifications.setNotificationHandler({
  handleNotification: async () => ({
    shouldShowAlert: true,
    shouldPlaySound: false,
    shouldSetBadge: false,
  }),
});

export default function App({navigation}) {
  TaskManager.defineTask(GEOFENCE, ({ data: { eventType, region }, error }) => {
    if (error) {
    // check `error.message` for more details.
      throw error;
    }
    if (eventType === Location.GeofencingEventType.Enter) {
      console.log("You've entered region:");
      inGeofence = true
      location.coords.latitude = region.latitude
      location.coords.longitude = region.longitude
      sendPushNotification(expoPushToken);
    } else if (eventType === Location.GeofencingEventType.Exit) {
      console.log("You've left region:");
      inGeofence = false
      location.coords.latitude = region.latitude
      location.coords.longitude = region.longitude
      sendPushNotification(expoPushToken);
    }
    else{ console.log("Chilling somewhere")}
  });

  const notificationListener = useRef();
  const responseListener = useRef();
  const [expoPushToken, setExpoPushToken] = useState('');
  const [notification, setNotification] = useState(false);
  const [location, setLocation] = useState({ // gets user location to start the map from their location
    timestamp: "",
    mocked: false,
    coords: {
      altitude: 100,
      heading: 0,
      altitudeAccuracy: 30,
      latitude: 30,
      speed: 0,
      longitude: -109,
      accuracy: 20
    }
  })
  useEffect(() => {
    registerForPushNotificationsAsync().then(token => setExpoPushToken(token));

    // This listener is fired whenever a notification is received while the app is foregrounded
    notificationListener.current = Notifications.addNotificationReceivedListener(notification => {
      setNotification(notification);
    });

    // This listener is fired whenever a user taps on or interacts with a notification (works when app is foregrounded, backgrounded, or killed)
    responseListener.current = Notifications.addNotificationResponseReceivedListener(response => {
      console.log(response);
    });

    return () => {
      Notifications.removeNotificationSubscription(notificationListener.current);
      Notifications.removeNotificationSubscription(responseListener.current);
    };
  }, []);

const [selectedTrail, setTrail] = useState({
  name: "Please select a trail to donate to."
})

const [errorMsg, setErrorMsg] = useState(null); // captures error message if user/phone does not allow locaiton 

useEffect(() => {
  (async () => {
    let { status } = await Location.requestForegroundPermissionsAsync(); // attempt to get user location permissions
    if (status !== 'granted') {
      setErrorMsg('Permission to access location was denied');
      return;
    }
    else{
      let location = await Location.getCurrentPositionAsync({}); // gets current location if allowed to 
      setLocation(location);
    }
  })();
}, []);

useEffect(() => { // check to see if permissions are enabled for location
  (async () => {
    let { status } = await Location.requestBackgroundPermissionsAsync();
    if (status !== 'granted') {
      setErrorMsg('Permission to access foreground location was denied');
      return;
    }
    else{
      let location = await Location.getCurrentPositionAsync({}); // gets current location if allowed to 
      setLocation(location);
    }
    const hasStarted =  Location.hasStartedLocationUpdatesAsync(
      GEOFENCE
    )
    if (hasStarted) {
      console.log("Already started Task")
    }
    else{
      console.log("Starting Geofencing Task")
    }
    
    
      
    const hasStartedGeo = await Location.hasStartedGeofencingAsync(
      GEOFENCE
    )
    if (hasStartedGeo) {
      console.log("Already started Geofence")
      return
    }
    
 
      

  })();
}, []);

  const trails = TrailData.features // stores the list of trails
  const trailMarker = [] // will store the information for the trail markers for the map
  for(let i = 0; i < Object.keys(TrailData.features).length; i++){ // adds each trailhead to the list with its name and location
    trailMarker.push( 
    <Marker key={i} // key is needed for the markers to work more efficiently 
    coordinate={{latitude:trails[i].geometry.coordinates[1], // latitude
      longitude:trails[i].geometry.coordinates[0]}} // longitiude
    title={trails[i].properties.Name}// trail name
    onPress={() => { // changes the name shown below the map, and zooms in on the trailhead selected
      setTrail(Object.assign({}, selectedTrail, {name: "Trail Name: " + trails[i].properties.Name}));
      setLocation(Object.assign({}, location, {coords: {latitude: trails[i].geometry.coordinates[1], longitude: trails[i].geometry.coordinates[0]}}));
      }}/> 
    // possibly use the description component to capture trail manger/maintainer
    )
  }


  return (
    <View style={{flex:1}}>
      {(function() {
          if (errorMsg) { // error mesaage if app was not given location access
            return <Text>Error Occured in recienving permission to get location.</Text>;
          } else {
            return <View style = {styles.container}>
              <MapView
              // radius = {40} // for future clustering
              // maxZoom = {16}
              // minPoints = {4}
              provider={PROVIDER_GOOGLE} // remove if not using Google Maps
              style={styles.circle}
              region={{
                latitude: location.coords.latitude, //initial latitude of user
                longitude: location.coords.longitude, // initial longitude of user
                // longitude: TrailData.features[1936].geometry.coordinates[0], //initial latitude of user
                // latitude: TrailData.features[1936].geometry.coordinates[1], // initial longitude of user
                latitudeDelta: 0.045,
                longitudeDelta: 0.0363
              }}
              > 
              {trailMarker}
            </MapView>
            <View style = {defaultSty.container}>
              <Text style = {defaultSty.blackHead2}>
              {selectedTrail.name}
              </Text>
              <PrimaryButton 
                text= 'Donate'
                onPress={() => navigation.navigate('Donate2', {trail:selectedTrail.name})}   
              />
            </View>
          </View>;
          }
        })()}
   </View>
  );
}

async function sendPushNotification(expoPushToken) {
  let message = {
    to: expoPushToken,
    sound: 'default',
    title: 'Original Title',
    body: 'And here is the body!',
    data: { someData: 'goes here' },}
    
  if (inGeofence==true){
    message.title = 'Entered Geofence'
    message.body = region[0].identifier
  }
  else {
    message.title = 'Exited Geofence'
    message.body = region[0].identifier
  }

  await fetch('https://exp.host/--/api/v2/push/send', {
    method: 'POST',
    headers: {
      Accept: 'application/json',
      'Accept-encoding': 'gzip, deflate',
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(message),
  });
}

async function registerForPushNotificationsAsync() {
  let token;
  if (Device.isDevice) {
    const { status: existingStatus } = await Notifications.getPermissionsAsync();
    let finalStatus = existingStatus;
    if (existingStatus !== 'granted') {
      const { status } = await Notifications.requestPermissionsAsync();
      finalStatus = status;
    }
    if (finalStatus !== 'granted') {
      alert('Failed to get push token for push notification!');
      return;
    }
    token = (await Notifications.getExpoPushTokenAsync()).data;

  } else {
    alert('Must use physical device for Push Notifications');
  }

  if (Platform.OS === 'android') {
    Notifications.setNotificationChannelAsync('default', {
      name: 'default',
      importance: Notifications.AndroidImportance.MAX,
      vibrationPattern: [0, 250, 250, 250],
      lightColor: '#FF231F7C',
    });
  }

  return token;
}

const styles = StyleSheet.create({ // style sheet for map
    // container: {
    //   ...StyleSheet.absoluteFillObject,
      
    //   justifyContent: 'flex-end',
    //   alignItems: 'center',
    // },
    // map: {
    //   ...StyleSheet.absoluteFillObject,
    // },
    container: {
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center',
      backgroundColor: 'white',
      height: 200,
    },
    circle: {
      borderRadius: 100,
        paddingVertical: 14,
        top: 0.5,
        //left: 21,
        margin: 10,
        width: 271,
        height: 271,
        
        //paddingHorizontal: 17,
        backgroundColor: '#59C092',
    }
   });  
   
  // Map Clustering Potiential 
  // initialRegion={{ 
  //               // latitude: location.coords.latitude, //initial latitude of user
  //               // longitude: location.coords.longitude, // initial longitude of user
  //               longitude: TrailData.features[1936].geometry.coordinates[0], //initial latitude of user
  //               latitude: TrailData.features[1936].geometry.coordinates[1], // initial longitude of user
  //               latitudeDelta: 0.015,
  //               longitudeDelta: 0.0121,
  //             }}