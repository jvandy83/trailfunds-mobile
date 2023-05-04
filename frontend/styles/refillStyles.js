import { StyleSheet } from "react-native";

export default refill = StyleSheet.create({
    container: {
      paddingTop: "25%",
      flex: 1,
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
      alignSelf: 'center',
    },
    panel: {
      paddingTop: 10,
      paddingHorizontal: 10,
    },
    label: {
      fontSize: 20,
    },
    text: {
      alignSelf: 'center',
      fontSize: 24,
      paddingTop: 50,
      paddingBottom: 10,
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
      margin: 10,
      padding: 10,
      backgroundColor: '#59C092',
      justifyContent: 'center',
      alignItems: 'center',
      borderRadius: 4,
    },
    buttonText: {
      fontSize: 18,
      color: '#444',
    },
  });