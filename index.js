// This is the first file that ReactNative will run when it starts up.
//
// We jump out of here immediately and into our main entry point instead.
//
// It is possible to have React Native load our main module first, but we'd have to
// change that in both AppDelegate.m and MainApplication.java.  This would have the
// side effect of breaking other tooling like mobile-center and react-native-rename.
//
// It's easier just to leave it here.
import { AppRegistry, Text, TextInput } from "react-native";
import App from "./src/App.tsx";

// Based on solution described in this post https://stackoverflow.com/questions/41807843/how-to-disable-font-scaling-in-react-native-for-ios-and-android-app/51414341#51414341
Text.defaultProps = Text.defaultProps || {};
Text.defaultProps.allowFontScaling = false;

TextInput.defaultProps = TextInput.defaultProps || {};
TextInput.defaultProps.allowFontScaling = false;

AppRegistry.registerComponent("main", () => App);

export default App;
