import { StyleSheet } from "react-native";

export default profile = StyleSheet.create({
  container: {
    flex: 1,
    //justifyContent: 'center',
    //alignItems: "center",
    //paddingTop: Constants.statusBarHeight,
    width: "100%",
    height: "100%",
    //backgroundColor: 'white',
    //padding: 8,
  },
  text: {
    color: "#52575D"
  },
  subText: {
    fontSize: 18,
    // color: "#AE5BC",
    textTransform: "uppercase",
    fontWeight:"500"
  },
  image: {
    width: 200,
    height: 250,
    borderRadius: 100,
  },
  titleBar: {
    flexDirection: "row",
    justifyContent: "space-between",
    marginTop: 24,
    marginHorizontal: 16  
  },
  profileImage: {
    width: 200,
    height: 200,
    borderRadius: 100,
    overflow: "hidden"
  },
  dm: {
    backgroundColor: "#41444B",
    position: "absolute",
    top: 20,
    width: 40,
    height: 40,
    borderRadius: 20,
    alignItems: "center",
    justifyContent: "center"
  },
  active: {
    backgroundColor: "#34FFB9",
    position: "absolute",
    bottom: 28,
    left: 10,
    padding: 4,
    height: 20,
    width: 20,
    borderRadius: 10
  },
  add: {
    backgroundColor: "#41444B",
    position: "absolute",
    bottom: 0,
    right: 0,
    width: 60,
    height: 60,
    borderRadius: 30,
    alignItems: "center",
    justifyContent: "center",
  },
  infoContainer: {
    alignSelf: "center",
    alignItems: "center",
    marginTop: 1,
  },
  statsContainer: {
    flexDirection: "row",
    alignSelf: "center",
    marginTop: 32,
    marginBottom: 32
  },

  statsBox: {
    alignItems: "center",
    flex: 1,
  },
  paymentButton: {
     borderRadius: 100,
     top:0.5,
     bottom:0.5,
     margin: 10,
     width: 223,
     height: 48,
     backgroundColor: '#59C092',
     alignSelf: "center",
     justifyContent: "center",

  },
  profileButton: {
    borderRadius: 100,
     top:0.5,
     bottom:0.5,
     margin: 10,
     width: 223,
     height: 48,
     backgroundColor: '#59C092',
     alignSelf: "center",
     justifyContent: "center",
  },
    learnButton: {
     borderRadius: 100,
     top:0.5,
     bottom:0.5,
     margin: 10,
     width: 170,
     height: 48,
     backgroundColor: 'black',
     alignSelf: "center",
     justifyContent: "center",
  },
  textUse: {
    margin: 4,
    paddingHorizontal: 5,
    textAlign: "center",
    backgroundColor: "white",
    color: '#008f68',
    fontSize: 12,
  },
    background: {
    paddingTop: 50,
    width: "100%",
    height: "100%",
  },
});
