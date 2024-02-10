import { View, Image, StyleSheet } from "react-native";

import { useAuth0 } from "react-native-auth0";

import { Svg, Path, G } from "react-native-svg";

import { HideKeyboard } from "../components/hideKeyboard";

import { PrimaryButton } from "../reduxStore/styles/frontendStyles";

import { mountains } from "../assets/images";

export const Login = () => {
  const { authorize, user } = useAuth0();

  const onPress = async () => {
    try {
      await authorize();
    } catch (e) {
      console.log(e);
    }
  };

  return (
    <HideKeyboard>
      <View>
        <View>
          <Image
            source={mountains}
            style={{ height: "100%", width: "100%" }}
            resize="center"
          />
        </View>

        <View
          style={{
            position: "absolute",
          }}
        >
          <Svg
            style={{
              marginTop: "25%",
            }}
            width={1024}
            height={768}
            viewbox="0 0 100 100"
          >
            <G>
              <Path
                id="svg_1"
                fill="white"
                stroke="white"
                d="m0,80q100,-130, 200,0t250,0l0,800l-500,0l0,-100l0,770l0,-700l0,-70l0,100l0,-80l0,30l0,-20l0,-20l0,-10z"
              />
            </G>
          </Svg>
        </View>
        <View
          style={{
            position: "absolute",
            left: 15,
            zIndex: 200,
          }}
        >
          <Svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 38.81 44.29">
            <Path
              d="M24.91 18.22h-2.27V7.3h8.87c4.03 0 7.3-3.27 7.3-7.3s-5.55 0-5.55 0H7.3C3.27 0 0 3.27 0 7.3l14.8.06v36.93a7.84 7.84 0 0 0 7.84-7.84V25.59h9.63c0-4.07-3.3-7.36-7.36-7.36Z"
              style={{
                fill: "#5cc093",
              }}
            />
          </Svg>
        </View>

        <View
          style={{
            position: "absolute",
            zIndex: 500,
            width: "100%",
            height: "50%",
            bottom: -60,
          }}
        >
          <View style={{ alignItems: "center" }}>
            <PrimaryButton onPress={onPress} text="Get started" color="white" />
          </View>
        </View>
      </View>
    </HideKeyboard>
  );
};

const styles = StyleSheet.create({
  loginInput: {
    backgroundColor: "white",
    paddingVertical: 10,
    paddingHorizontal: 20,
    borderRadius: 100,
    borderColor: "rgba(0, 0, 0, 0.2)",
    borderWidth: 1,
  },
});
