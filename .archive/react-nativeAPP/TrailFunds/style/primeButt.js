//Here you will find the style for the primary button that we use for 'DONATE'

import react from "react";
import { StyleSheet, TouchableOpacity, Text, View} from "react-native";
import { backgroundColor } from "react-native/Libraries/Components/View/ReactNativeStyleAttributes";

export default function PrimaryButton({ text, onPress }){
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
        top: 0.5,
        //left: 21,
        margin: 10,
        width: 271,
        height: 48,
        
        //paddingHorizontal: 17,
        backgroundColor: '#59C092',
    },
    buttonText: {
        color: 'black',
        fontWeight: 'bold',
        textTransform: 'uppercase',
        fontSize: 16,
        textAlign: 'center',
    }
})