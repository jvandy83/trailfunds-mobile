import { useState, useEffect } from "react";

import { useDispatch } from "react-redux";

import {
  View,
  Image,
  TextInput,
  StyleSheet,
  Pressable,
  Text,
  Platform,
  KeyboardAvoidingView,
  Keyboard,
  Alert,
} from "react-native";

import Ionicons from "@expo/vector-icons/Ionicons";

import { saveToken, setAuth } from "../reduxStore/features/auth/authSlice";

import { Svg, Path, G } from "react-native-svg";

import uuid from "react-native-uuid";

import { useSignUpMutation, useLoginMutation } from "../services/api";

import { useInputValidation } from "../hooks/useInputValidation";

import { HideKeyboard } from "../components/hideKeyboard";

import { PrimaryButton } from "../styles/frontendStyles";

import {
  mountains,
  googleIcon,
  facebookIcon,
  appleIcon,
} from "../assets/images";

export const Login = () => {
  const [newUser, setNewUser] = useState(false);
  const [values, setValues] = useState({
    firstName: "",
    lastName: "",
    email: "",
    password: "",
  });
  const [errors, setErrors] = useState({});
  const [serverSideErrors, setServerSideErrors] = useState([]);

  const [keyboardIsShowing, setKeyboardIsShowing] = useState(false);

  const [showPassword, setShowPassword] = useState(false);

  const [signUp, { isLoading, error }] = useSignUpMutation();
  // create alias due to multiple mutations
  // being called in the same module
  const [login, { isLoading: isLoginLoading, error: loginError }] =
    useLoginMutation();

  const dispatch = useDispatch();

  const clearInputs = () => {
    setErrors({});
    setServerSideErrors([]);
    setValues({ firstName: "", lastName: "", email: "", password: "" });
  };

  const handleSubmit = async () => {
    const { errorResults } = useInputValidation(values);
    setErrors(errorResults);
    if (newUser) {
      for (let potentialError in errorResults) {
        if (errorResults[potentialError].length > 0) {
          return;
        }
      }
      // calling unwrap makes the return
      // value available ready immediately
      signUp({ ...values, isNew: true })
        .unwrap()
        .then((res) => {
          if (res.status_code >= 200 && res.status_code < 400) {
            const { currentUser, accessToken } = res;
            saveToken("accessToken", accessToken);
            dispatch(setAuth({ token: accessToken, currentUser }));
          } else {
            const { error } = res.data;
            console.log("ERROR ON SIGN UP: ", error);
            const errorSet = new Set();
            // check to see if same error message is added if
            // a user hits submit multiple times
            // without changing form values
            errorSet.add(error.message);
            setServerSideErrors(Array.from(errorSet));
          }
        })
        .catch((error) => {
          //	error = {"data": {"detail": "Not authenticated"}, "status": 401}
          const { data } = error;
          setServerSideErrors([data?.detail || "Something went wrong"]);
        });
    } else {
      if (
        errorResults["email"].length > 0 ||
        errorResults["password"].length > 0
      ) {
        return;
      }
      login({ ...values, isNew: false })
        // login({ ...values, isNew: false })
        .unwrap()
        .then((res) => {
          if (res.status_code >= 200 && res.status_code < 400) {
            const { currentUser, accessToken } = res;
            saveToken("accessToken", accessToken);
            dispatch(setAuth({ token: accessToken, currentUser }));
          } else {
            const { error } = res;
            const errorSet = new Set();
            // check to see if same error message is added if
            // a user hits submit multiple times
            // without changing form values
            errorSet.add(error.message);
            setServerSideErrors(Array.from(errorSet));
          }
        })
        .catch((error) => {
          const { data } = error;
          setServerSideErrors([data?.detail || "Something went wrong"]);
        });
    }
  };

  const handleShowPassword = () => {
    setShowPassword((prev) => !prev);
  };

  const handleChange = (text, inputType) => {
    setValues((prev) => ({
      ...prev,
      [inputType]: text,
    }));
  };

  useEffect(() => {
    const keyboardDidHideListener = Keyboard.addListener(
      "keyboardDidHide",
      () => {
        setKeyboardIsShowing(false);
      }
    );
    const keyboardDidShowListener = Keyboard.addListener(
      "keyboardDidShow",
      () => {
        setKeyboardIsShowing(true);
      }
    );
    return () => {
      keyboardDidHideListener.remove();
      keyboardDidShowListener.remove();
    };
  }, []);

  if (isLoading || isLoginLoading) {
    return (
      <View>
        <Text>Loading...</Text>
      </View>
    );
  }

  if (error || loginError) {
    const errorStatus = error || loginError;
    console.log(errorStatus.detail);
  }

  return (
    <KeyboardAvoidingView
      behavior={Platform.OS === "ios" ? "padding" : "height"}
      style={{ backgroundColor: "#fff" }}
    >
      <HideKeyboard>
        <View style={{ marginBottom: keyboardIsShowing && "80%" }}>
          {keyboardIsShowing ? (
            <View
              style={{
                position: "relative",
                backgroundColor: "#fff",
                height: "100%",
                width: "100%",
              }}
            ></View>
          ) : (
            <View>
              <Image
                source={mountains}
                style={{ height: "100%", width: "100%" }}
                resize="center"
              />
            </View>
          )}
          <Text
            style={{
              position: "absolute",
              fontSize: 30,
              fontWeight: "bold",
              color: "#414d59",
              top: "52%",
              right: 40,
              zIndex: 800,
              textShadowOffset: { width: 2, height: 2 },
              textShadowColor: "rgba(0, 0, 0, 0.4)",
              textShadowRadius: 5,
            }}
          >
            {`${newUser ? "Sign Up" : "Sign In"}`}
          </Text>
          {!keyboardIsShowing && (
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
          )}
          <View
            style={{
              width: keyboardIsShowing ? 50 : 200,
              height: keyboardIsShowing ? 75 : 350,
              position: "absolute",
              marginTop: keyboardIsShowing ? "12%" : "32%",
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
            <Text style={{ paddingBottom: "1%", paddingHorizontal: "10%" }}>
              {serverSideErrors.length > 0 &&
                serverSideErrors?.map((e) => (
                  <Text
                    key={uuid.v4()}
                    style={{ color: "#f67172", fontWeight: "bold" }}
                  >
                    {e}
                  </Text>
                ))}
            </Text>
            {newUser && (
              <View style={{ marginTop: -20 }}>
                <View
                  style={{
                    paddingVertical: "1%",
                    paddingHorizontal: 30,
                  }}
                >
                  <Text>
                    {values.password?.length > 1 &&
                      errors.password &&
                      errors.password?.map((e) => (
                        <View>
                          <Text
                            key={uuid.v4()}
                            style={{ color: "#f67172", fontWeight: "bold" }}
                          >
                            {e}
                          </Text>
                        </View>
                      ))}
                  </Text>
                  <TextInput
                    style={{
                      ...styles.loginInput,
                      borderColor:
                        errors["first name"]?.length > 0
                          ? "#f67172"
                          : "rgba(0, 0, 0, 0.2)",
                    }}
                    placeholder="first name"
                    value={values.firstName || ""}
                    onChangeText={(text) => handleChange(text, "firstName")}
                  />
                </View>
                <View style={{ paddingVertical: "1%", paddingHorizontal: 30 }}>
                  <TextInput
                    style={{
                      ...styles.loginInput,
                      borderColor:
                        errors["last name"]?.length > 0
                          ? "#f67172"
                          : "rgba(0, 0, 0, 0.2)",
                    }}
                    placeholder="last name"
                    value={values.lastName || ""}
                    onChangeText={(text) => handleChange(text, "lastName")}
                  />
                </View>
              </View>
            )}
            <View style={{ paddingVertical: "1%", paddingHorizontal: 30 }}>
              <TextInput
                style={{
                  ...styles.loginInput,
                  borderColor:
                    errors.email?.length > 0 ? "#f67172" : "rgba(0, 0, 0, 0.2)",
                }}
                autoCapitalize="none"
                placeholder="E-mail"
                value={values.email || ""}
                autoComplete="email"
                onChangeText={(text) => handleChange(text, "email")}
              />
            </View>
            <View style={{ paddingVertical: "1%", paddingHorizontal: 30 }}>
              <TextInput
                style={{
                  ...styles.loginInput,
                  borderColor:
                    errors.password?.length > 0
                      ? "#f67172"
                      : "rgba(0, 0, 0, 0.2)",
                }}
                autoCapitalize="none"
                placeholder="Password"
                value={values.password || ""}
                secureTextEntry={!showPassword}
                onChangeText={(text) => handleChange(text, "password")}
              />
              <View className="items-end">
                <View className="absolute bottom-2 right-4">
                  <Ionicons
                    onPress={handleShowPassword}
                    name={`${showPassword ? "eye" : "eye-off"}`}
                    size={20}
                  />
                </View>
              </View>
            </View>
            <View style={{ alignItems: "center" }}>
              <PrimaryButton
                onPress={handleSubmit}
                text={`${!newUser ? "Sign in" : "Sign up"}`}
                color="white"
              />
              {newUser && (
                <Pressable
                  onPress={() => {
                    setNewUser(false);
                    clearInputs();
                  }}
                >
                  <Text style={{ fontWeight: "bold", paddingTop: "1%" }}>
                    I already have an account
                  </Text>
                </Pressable>
              )}
              {!newUser && (
                <View style={{ alignItems: "center" }}>
                  <View style={{ flexDirection: "row" }}>
                    <Pressable
                      onPress={() => {
                        clearInputs();
                        setNewUser(true);
                      }}
                      style={{
                        borderRadius: 100,
                        paddingVertical: 10,
                        paddingHorizontal: 20,
                        borderWidth: 1,
                        borderColor: "black",
                        margin: 4,
                      }}
                    >
                      <View style={{ alignItems: "center" }}>
                        <Text>Sign up</Text>
                      </View>
                    </Pressable>
                    <Pressable
                      style={{
                        borderRadius: 100,
                        paddingVertical: 10,
                        paddingHorizontal: 20,
                        borderWidth: 1,
                        borderColor: "black",
                        backgroundColor: "black",
                        margin: 4,
                      }}
                    >
                      <View style={{ alignItems: "center" }}>
                        <Text style={{ color: "white" }}>Forgot Password</Text>
                      </View>
                    </Pressable>
                  </View>
                  <View
                    style={{
                      flexDirection: "row",
                      alignItems: "center",
                    }}
                  >
                    <View
                      style={{
                        borderBottomColor: "black",
                        borderBottomWidth: 1,
                        paddingVertical: 10,
                        paddingHorizontal: 10,
                        width: "30%",
                      }}
                    />
                    <Text
                      style={{
                        transform: [{ translateY: 9 }],
                        paddingHorizontal: 3,
                      }}
                    >
                      OR
                    </Text>
                    <View
                      style={{
                        borderBottomColor: "black",
                        borderBottomWidth: 1,
                        paddingVertical: 10,
                        paddingHorizontal: 10,
                        width: "30%",
                      }}
                    />
                  </View>
                  <View
                    style={{
                      flexDirection: "row",
                      marginTop: 20,
                    }}
                  >
                    <Image
                      source={googleIcon}
                      style={{ width: 50, height: 50, marginHorizontal: 30 }}
                      resize="center"
                    />
                    <Image
                      source={appleIcon}
                      style={{ width: 50, height: 50, marginHorizontal: 30 }}
                      resize="center"
                    />
                    <Image
                      source={facebookIcon}
                      style={{ width: 50, height: 50, marginHorizontal: 30 }}
                      resize="center"
                    />
                  </View>
                </View>
              )}
            </View>
          </View>
        </View>
      </HideKeyboard>
    </KeyboardAvoidingView>
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
