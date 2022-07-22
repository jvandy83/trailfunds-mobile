//Here you will find the style for the primary button that we use for 'DONATE'

import { StyleSheet, TouchableOpacity, Text, View} from "react-native";

export default function GreenTextButt({ text, onPress }){
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
        margin: 5,
        height: 30,
        backgroundColor: 'transparent',
    },
    buttonText: {
        color: '#59C092',
        fontWeight: 'bold',
        fontSize: 18,
        textAlign: 'center',
    }
})