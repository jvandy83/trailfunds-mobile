//This is the basic styles that came with the default template. I kept it because it helps keep things clean.

import { StyleSheet, Dimensions } from "react-native";
import { React } from "react";

const defaultSty = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
  inputLong: {
    borderColor: "#808080",
    width: "90%",
    //borderWidth: 1,
    borderRadius: 20,
    padding: 15,
    backgroundColor: "#e8eaed",
    color: "#000000",
    fontWeight: "bold",
  },
  inputShort: {
    borderColor: "#808080",
    width: "42%",
    //borderWidth: 1,
    borderRadius: 20,
    padding: 15,
    backgroundColor: "#e8eaed",
    //color: '#000000',
    fontWeight: "bold",
    marginHorizontal: 10,
    marginVertical: 10,
  },
  inner: {
    padding: 24,
    flex: 1,
    justifyContent: "space-around",
  },
  subStyle: {
    color: "#737373",
    fontSize: 20,
  },
  buttonSty1: {
    color: "#59C092",
    fontWeight: "bold",
    textTransform: "uppercase",
  },
  head1: {
    color: "#59C092",
    fontSize: 44,
  },
  blackHead1: {
    color: "#1C2126",
    fontWeight: "bold",
    fontSize: 26,
  },
  blackHead2: {
    color: "#1C2126",
    fontWeight: "bold",
    fontSize: 18,
  },
  textStyle: {
    color: "green",
    fontSize: 60,
  },
  image: {
    flex: 1,
    justifyContent: "center",
  },
  darkTextHead: {
    color: "#1C2126",
    fontSize: 30,
    textAlign: "center",
    padding: 10,
    fontWeight: "bold",
  },
  greenTextHead: {
    color: "#59C092",
    fontSize: 30,
  },
  subHeadText: {
    color: "#737373",
    fontSize: 16,
    textAlign: "center",
    padding: 35,
    fontWeight: "bold",
  },
  overlay: {
    //This is makes photos with a transparent look (Example in LandingPage.js)
    backgroundColor: "rgba(255,255,255,0.5)",
  },
  greenBackGround: {
    backgroundColor: "#59C092",
  },
  basicBlackText: {
    color: "#1C2126",
    //textAlign: 'center',
    fontSize: 16,
    fontWeight: "bold",
  },
  basicGreenText: {
    color: "#59C092",
    //textAlign: 'center',
    fontSize: 16,
    fontWeight: "bold",
  },
  basicWhiteHeader: {
    color: "#FCFCFC",
    fontSize: 26,
  },
  legalText: {
    color: "#1C2126",
    fontSize: 8,
    paddingHorizontal: 30,
    marginVertical: 15,
  },
  loved2Death: {
    paddingTop: 25,
    color: "#1C2126",
    fontSize: 30,
    marginLeft: 28,
    marginRight: 37,
    fontWeight: "bold",
  },
  DeathLife: {
    color: "#59C092",
    fontSize: 30,
  },
  Help2Life: {
    paddingBottom: 25,
    color: "#1C2126",
    fontSize: 30,
    textAlign: "right",
    marginRight: 28,
    marginLeft: 37,
    fontWeight: "bold",
  },
  centerTheThings: {
    flex: 1,
    alignItems: "center",
    justifyContent: "space-between",
  },
  row: {
    flexDirection: "row",
    alignSelf: "center",
  },
  column: {
    flexDirection: "column",
    alignItems: "center",
  },
  sponsorsNames: {
    color: "#59C092",
    fontSize: 22,
    fontWeight: "bold",
    paddingBottom: 20,
  },
});

export default defaultSty;
