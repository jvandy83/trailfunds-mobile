//This is the basic styles that came with the default template. I kept it because it helps keep things clean.

//Our main green color hex code is #59C092
//Look at the styleTest page to see how these things get called

import { StyleSheet, Dimensions } from "react-native";
import { React } from "react";

const defaultSty = StyleSheet.create({
  container: {
    //This is the style that is added to every page
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
  greenTextHead: {
    color: "#59C092",
    fontSize: 40,
    fontWeight: "bold",
  },
  blackLargeText: {
    color: "Black",
    fontSize: 40,
  },
});

export default defaultSty;
