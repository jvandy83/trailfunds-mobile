//For the love of all that is holy do not put anything above this first import!
import "react-native-gesture-handler";
//Put imports below this. Please and thank you.

import React from "react";
import { NavigationContainer } from "@react-navigation/native"; //Allows for navigation in the app
import { StackHome } from "./routes/stack"; //Importing the main stack of pages for the app

export default function App() {
  return (
    <NavigationContainer>
      <StackHome />
    </NavigationContainer>
  );
}
