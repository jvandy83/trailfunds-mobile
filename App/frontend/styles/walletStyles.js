import { StyleSheet } from "react-native";

export default wallet = StyleSheet.create({
    container: {
      paddingTop: "30%",
      justifyContent: "top",
      flex: 1,
      alignItems: 'center'
    },
    header: {
      width: '100%',
      backgroundColor: '#dcdcdc',
      paddingTop: 48,
      paddingBottom: 10,
      borderBottomWidth: StyleSheet.hairlineWidth,
      alignItems: 'center',
    },
    title: {
      fontSize: 22,
      color: '#333',
      fontWeight: 'bold',
      paddingBottom: 50,
    },
    panel: {
      paddingTop: 10,
      paddingHorizontal: 10,
    },
    label: {
      paddingBottom: 10,
      fontSize: 20,
    },
    text: {
      fontSize: 24,
      paddingTop: 10,
    },
    inputField: {
      backgroundColor: '#fff',
      height: 44,
      borderWidth: 1,
      borderColor: '#333',
      width: '100%',
      padding: 10,
      marginTop: 12,
    },
    button: {
      borderRadius: 100,
      paddingVertical: 14,
      top:0.5,
      bottom:0.5,
      margin: 10,
      width: 223,
      height: 48,
      padding: 10,
      backgroundColor: '#59C092',
      justifyContent: 'center',
      alignItems: 'center',
      borderRadius: 50,
    },
    secondaryButton: {
      borderRadius: 100,
      paddingVertical: 14,
      top:0.5,
      bottom:0.5,
      margin: 10,
      width: 223,
      height: 48,
      padding: 10,
      backgroundColor: 'black',
      justifyContent: 'center',
      alignItems: 'center',
      borderRadius: 50,
    },
    buttonText: {
      fontSize: 18,
      color: '#444',
    },
  });