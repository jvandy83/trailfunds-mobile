//This is the secondary button, this will be used for the contact page and more

import react from "react";
import { StyleSheet, TouchableOpacity, Text, View} from "react-native";
import { backgroundColor } from "react-native/Libraries/Components/View/ReactNativeStyleAttributes";

export default function SecondaryButton({ text, onPress }){
    return (
        <TouchableOpacity onPress={onPress}>
            <View style={styles.button}>
                <Text style={styles.buttonText}> { text }</Text>
            </View>
        </TouchableOpacity>
    )
}

const styles = StyleSheet.create({
    button: {
        borderRadius: 100,
        paddingVertical: 14,
        top:0.5,
        bottom:0.5,
        margin: 10,
        //left: 21,
        width: 223,
        height: 48,
        //paddingHorizontal: 17,
        backgroundColor: '#1C2126',
    },
    buttonText: {
        color: 'white',
        fontWeight: 'bold',
        textTransform: 'uppercase',
        fontSize: 16,
        textAlign: 'center',
    }
})