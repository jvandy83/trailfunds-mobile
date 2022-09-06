import React from 'react';

//import all the components we are going to use
import { SafeAreaView,  StyleSheet,  View,  Image, Text} from 'react-native';

export default function CirclePicture({ }){
  return (
    //<SafeAreaView style={{flex: 1}}>
    <View style={styles.container}>
        <Image source={require('../assets/lunchLoops.png')} style={styles.circle}/>
    </View>
    //</SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    //flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'white',
    height: 200,
  },
  circle: {
    width: 200,
    height: 200,
    borderRadius: 200 / 2
  }
});