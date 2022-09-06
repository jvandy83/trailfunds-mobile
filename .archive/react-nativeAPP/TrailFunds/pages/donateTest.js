//
//
//            This page is just for testing things, I made it because I was working with flex boxes.
//            DELETE THIS BEFORE GOING LIVE
//

import React, { useState } from "react";
import {
  Button,
  View,
  Text,
  TouchableOpacity,
  TextInput,
  StyleSheet,
  KeyboardAvoidingView,
  Switch,
  Dimensions,
  PixelRatio,
} from "react-native";
import defaultSty from "../style/defaultSty";
import PrimaryButton from "../style/primeButt";
import { SafeAreaView } from "react-native-safe-area-context";

function DonateTest() {
  const [switch1, setSwitch1] = useState(false);
  const [switch2, setSwitch2] = useState(false);
  const [switch3, setSwitch3] = useState(false);
  const [switch4, setSwitch4] = useState(false);

  const handleAllSwitchSelection = () => {
    setSwitch2(true);
    setSwitch3(true);
    setSwitch4(true);
  };
  const handleAllSwitchDeselect = () => {
    setSwitch2(false);
    setSwitch3(false);
    setSwitch4(false);
  };
  const checkSwitches = () => {
    if (switch2 == true) {
      if (switch3 == true) {
        if (switch4 == true) {
          setSwitch1(true);
        }
      }
    }
  };
  const toggleSwitch1 = () => {
    if (switch1 == false) {
      setSwitch1(true);
      handleAllSwitchSelection();
    }
    if (switch1 == true) {
      setSwitch1(false);
      handleAllSwitchDeselect();
    }
  };
  const toggleSwitch2 = () => {
    setSwitch2((previousState) => !previousState);
    setSwitch1(false);
    //checkSwitches()
  };
  const toggleSwitch3 = () => {
    setSwitch3((previousState) => !previousState);
    setSwitch1(false);
    //checkSwitches()
  };
  const toggleSwitch4 = () => {
    setSwitch4((previousState) => !previousState);
    setSwitch1(false);
    //checkSwitches()
  };
  const { width: SCREEN_WIDTH, hight: SCREEN_HIGHT } = Dimensions.get("window");

  const scale = SCREEN_WIDTH / 375;

  function normalize(size) {
    const newSize = size * scale;
    if (Platform.OS == "ios") {
      return Math.round(PixelRatio.roundToNearestPixel(newSize));
    }
    return Math.round(PixelRatio.roundToNearestPixel(newSize)) - 2;
  }

  return (
    <View style={donatePg2Sty.parentFlexBox}>
      <View style={[donatePg2Sty.centerText, { flexDirection: "column" }]}>
        <Text style={[defaultSty.loved2Death, { fontSize: normalize(30) }]}>
          Step 2
        </Text>
        <Text style={[defaultSty.loved2Death, { fontSize: normalize(30) }]}>
          Select Trail Org
        </Text>
        <Text style={[defaultSty.basicBlackText, { fontSize: normalize(16) }]}>
          Grand Junction CO
        </Text>
      </View>
      <View style={[donatePg2Sty.textFlexBox, { alignItems: "flex-end" }]}>
        <Text style={[defaultSty.basicBlackText, { fontSize: normalize(16) }]}>
          Donate to All:
        </Text>
      </View>
      <View style={[donatePg2Sty.switchFlexBox, { alignItems: "flex-start" }]}>
        <Switch onValueChange={toggleSwitch1} value={switch1} />
      </View>
      <View style={[donatePg2Sty.textFlexBox, { alignItems: "flex-start" }]}>
        <Text style={[defaultSty.loved2Death, { fontSize: normalize(23) }]}>
          COPMOBA
        </Text>
      </View>
      <View style={[donatePg2Sty.switchFlexBox, { alignItems: "flex-end" }]}>
        <Switch onValueChange={toggleSwitch2} value={switch2} style={{}} />
      </View>
      <View
        style={[
          donatePg2Sty.textFlexBox,
          { flexWrap: "wrap", alignItems: "flex-start" },
        ]}
      >
        <Text style={[defaultSty.loved2Death, { fontSize: normalize(23) }]}>
          The Great Outdoors Fund
        </Text>
      </View>
      <View style={[donatePg2Sty.switchFlexBox, { alignItems: "flex-end" }]}>
        <Switch onValueChange={toggleSwitch3} value={switch3} style={{}} />
      </View>
      <View style={[donatePg2Sty.textFlexBox, { alignItems: "flex-start" }]}>
        <Text style={[defaultSty.loved2Death, { fontSize: normalize(23) }]}>
          Your Favorate Orgs
        </Text>
      </View>
      <View style={[donatePg2Sty.switchFlexBox, { alignItems: "flex-end" }]}>
        <Switch onValueChange={toggleSwitch4} value={switch4} style={{}} />
      </View>
      <View style={donatePg2Sty.centerText}>
        <PrimaryButton
          text="Next"
          onPress={() => alert([switch1, switch2, switch3, switch4])}
        />
      </View>
    </View>
  );
}

const donatePg2Sty = StyleSheet.create({
  parentFlexBox: {
    display: "flex",
    flexDirection: "row",
    flexWrap: "wrap",
    width: "100%",
    height: "100%",
    alignContent: "center",
    alignItems: "center",
  },
  switchFlexBox: {
    display: "flex",
    width: "50%",
    justifyContent: "center",
    alignItems: "center",
    marginRight: "auto",
    paddingRight: 20,
  },
  textFlexBox: {
    display: "flex",
    width: "50%",
    justifyContent: "center",
    alignItems: "center",
    marginRight: "auto",
    marginBottom: 15,
  },
  centerText: {
    display: "flex",
    width: "100%",
    alignItems: "center",
  },
});

export default DonateTest;
