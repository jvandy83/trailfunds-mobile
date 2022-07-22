//these are the hollow buttons that we use for the 'Back' and 'Home' area

import { StyleSheet, TouchableOpacity, Text, View} from "react-native";

export default function HollowButton({ text, onPress }){
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
        width: 98,
        height: 48,
        margin: 10,
        //paddingHorizontal: 17,
        borderWidth: 1,
        borderColor: '#1C2126',
    },
    buttonText: {
        color: '#1C2126',
        fontWeight: 'bold',
        textTransform: 'uppercase',
        fontSize: 16,
        textAlign: 'center',
    }
})