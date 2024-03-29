import { useState, useRef, useEffect } from "react";
import {
  View,
  Text,
  StyleSheet,
  Pressable,
  Alert,
  Platform,
} from "react-native";

import { useIsFocused, useNavigation } from "@react-navigation/native";

import {
  useStripe,
  usePlatformPay,
  PlatformPay,
} from "@stripe/stripe-react-native";

import { useAddTrailbucksMutation, useGetMeQuery } from "../services/api";

import { useAuth0 } from "react-native-auth0";

import { formatCurrency } from "../utils/currencyFormatter";

import { CustomInputModal } from "../components/modal/CustomInputModal";

import { MainLayout } from "../components/layout/MainLayout";

import { BottomSheetModalComponent } from "../components/bottomSheet/BottomSheetModalComponent";

import { Icon } from "@components/icons";

import {
  PrimaryButton,
  SecondaryButton,
  defaults,
} from "../reduxStore/styles/frontendStyles";

import { FontAwesomeIcon } from "@fortawesome/react-native-fontawesome";

import { faInfoCircle } from "@fortawesome/free-solid-svg-icons";

import axios from "axios";

const preselectedInputs = {
  5: 0,
  10: 0,
  20: 0,
  other: "",
};

const currentAmounts = {
  customAmount: 0,
  selectAmount: 5,
};

const baseUrl = process.env.EXPO_PUBLIC_BASE_URL;
console.log("BASE_URL: ", baseUrl);

export const WalletRefill = ({ navigation }) => {
  const { navigate } = useNavigation();

  const { getCredentials, user } = useAuth0();

  /* ----> LOCAL STATE <---- */

  const [ready, setReady] = useState(true);

  const [paymentIntent, setPaymentIntent] = useState("");

  const [donationAmount, setDonationAmount] = useState();

  const [verifyPaymentAmount, setVerifiedPaymentAmount] = useState(false);

  const [initPaymentSheetStarted, setInitPaymentSheetStarted] = useState(false);

  const [showCustomAmountInput, setShowCustomAmountInput] = useState(false);

  const [preselectedInputAmount, setPreselectedAmount] = useState({
    5: 5,
    10: 0,
    20: 0,
    other: "",
  });

  const [amount, setSelectedAmount] = useState({
    customAmount: 0,
    selectAmount: 5,
  });

  const [showInfoIcon, setShowInfoIcon] = useState(false);

  /* ----> REDUX HOOKS <---- */

  const [addTrailbucks, { isLoading, isUpdating }] = useAddTrailbucksMutation();

  const {
    data,
    isLoading: isUserLoading,
    error,
  } = useGetMeQuery({}, { skip: !useIsFocused() });

  /* ----> REFS <---- */
  const textInputRef = useRef(null);

  /*----> Stripe SDK <----*/
  const { presentPaymentSheet, initPaymentSheet } = useStripe();

  const { isPlatformPaySupported, confirmPlatformPayPayment } =
    usePlatformPay();

  // helper util function
  // TODO:
  // 	- move this function to util
  // 		folder since it's being used
  // 		in Donation screen
  const normalizeCurrency = () => {
    const currency =
      parseFloat(amount.customAmount) > amount.selectAmount
        ? parseFloat(amount.customAmount)
        : amount.selectAmount;
    const { parsedForUI, convertToPennies, amountPlusFee, parsedAmount } =
      formatCurrency(currency);
    return { parsedForUI, convertToPennies, amountPlusFee, parsedAmount };
  };

  const buyWithApplePay = async () => {
    setReady(false);
    const response = await confirmPlatformPayPayment(paymentIntent, {
      applePay: {
        cartItems: [
          {
            amount: String(normalizeCurrency().parsedAmount),
            paymentType: PlatformPay.PaymentType.Immediate,
          },
        ],
        testEnv: true,
        merchantCountryCode: "US",
        currencyCode: "USD",
      },
    });

    if (response.error) {
      setReady(true);
      alert(`Error: ${response.error.message}`);
      return;
    }
    addTrailbucks({ amount: donationAmount });
    setReady(true);
    Alert.alert(
      "Your payment was successful",
      `You successfully loaded Trailbucks onto your virtual card! Select a trail from the map to donate or donate the next time you're near a trail and get a notification.`,
      [
        {
          text: "OK",
          onPress: () => {
            setReady(true);
            setSelectedAmount(currentAmounts);
            setPreselectedAmount({
              5: 5,
              10: 0,
              20: 0,
              other: "",
            });
            navigation.navigate("Wallet");
          },
        },
      ]
    );
  };

  const buyWithGooglePay = async () => {
    setReady(false);
    const { error } = await confirmPlatformPayPayment(paymentIntent, {
      googlePay: {
        testEnv: true,
        merchantCountryCode: "US",
        currencyCode: "USD",
        billingAddressConfig: {
          format: PlatformPay.BillingAddressFormat.Full,
          isPhoneNumberRequired: true,
          isRequired: true,
        },
      },
    });

    if (error) {
      setReady(true);
      Alert.alert(error.code, error.message);
      // Update UI to prompt user to retry payment (and possibly another payment method)
      return;
    }
    addTrailbucks({ amount: donationAmount });
    setReady(true);
    Alert.alert("Success", "The payment was confirmed successfully.");
  };

  const buyWithCard = async () => {
    setReady(false);
    const { error, paymentOption } = await presentPaymentSheet({
      confirmPayment: false,
      amount: String(normalizeCurrency().parsedAmount),
    });
    if (error) {
      setReady(true);
      alert(`Error: ${error.message}`);
      return;
    }
    addTrailbucks({
      amount: donationAmount,
    });
    setReady(false);
    Alert.alert(
      "Your payment was successful",
      "You can now donate to your favorite trails!",
      [
        {
          text: "OK",
          onPress: () => {
            setReady(true);
            setSelectedAmount(currentAmounts);
            setPreselectedAmount({
              5: 5,
              10: 0,
              20: 0,
              other: "",
            });
            navigation.navigate("Wallet");
          },
        },
      ]
    );
  };

  const setup = async () => {
    if (!(await isPlatformPaySupported())) {
      Alert.alert(
        "Error",
        `${
          Platform.OS === "android" ? "Google" : "Apple"
        } Pay is not supported.`
      );
      return;
    }
  };

  const initializePaymentSheet = async (paymentIntent, ephemeralKey) => {
    try {
      const { error, paymentOption } = await initPaymentSheet({
        paymentIntentClientSecret: paymentIntent,
        customerEphemeralKeySecret: ephemeralKey,
        merchantDisplayName: "Trailfunds",
        style: "alwaysDark", // If darkMode
        googlePay: true, // If implementing googlePay
        applePay: true, // If implementing applePay
        merchantCountryCode: "US", // Countrycode of the merchant
        primaryButtonLabel: `$${String(normalizeCurrency().parsedAmount)}`,
        returnURL: `${process.env.EXPO_PUBLIC_BASE_URL}/stripe/stripe-redirect`,
      });
    } catch (error) {
      console.error(error.data);
    }
  };

  const handleInitiatePaymentIntent = async () => {
    const { idToken } = await getCredentials();
    const donationAmount =
      amount.customAmount > 5 ? amount.customAmount : amount.selectAmount;
    const URL = `${baseUrl}/payment-intents/${donationAmount}`;
    try {
      const response = await axios.get(URL, {
        headers: {
          Authorization: `Bearer ${idToken}`,
        },
      });

      const { clientSecret, ephemeralKey } = response.data;

      setPaymentIntent(clientSecret);
      setDonationAmount(donationAmount);

      try {
        await initializePaymentSheet(clientSecret, ephemeralKey);
      } catch (error) {
        console.error(error);
      }
    } catch (error) {
      console.error(error.response.data);
    }
  };
  /*----> End of Stripe SDK <----*/

  //------------------------------//

  /* ----> EVENT HANDLERS <---- */
  // modify local state to
  // control transaction flow
  const handleCustomAmountClick = () => {
    setPreselectedAmount({ ...preselectedInputs, other: "other" });
    setSelectedAmount({ selectAmount: 5, customAmount: 0 });

    setShowCustomAmountInput(true);
  };

  const handlePreselectedAmountClick = (value) => {
    if (typeof value === "number") {
      setPreselectedAmount({ ...preselectedInputs, [value]: value });
      setSelectedAmount({
        customAmount: 0,
        selectAmount: value,
      });
      setVerifiedPaymentAmount(true);
      return;
    }
    handleCustomAmountClick();
  };

  const handleCloseInfoIcon = () => {
    setShowInfoIcon(false);
  };

  /* ----> USE EFFECTS <---- */

  useEffect(() => {
    setup();
    handleInitiatePaymentIntent();
  }, []);

  useEffect(() => {
    verifyPaymentAmount && handleInitiatePaymentIntent();
    setInitPaymentSheetStarted(true);
    return () => setVerifiedPaymentAmount(false);
  }, [verifyPaymentAmount]);

  useEffect(() => {
    initPaymentSheetStarted && initializePaymentSheet();
    return () => setInitPaymentSheetStarted(false);
  }, [initPaymentSheetStarted]);

  useEffect(() => {
    if (textInputRef.current) {
      textInputRef.current.value = amount.customAmount || 0;
    }
  }, [amount.customAmount]);

  if (error) {
    console.error(error.data);
  }

  return (
    <MainLayout styleProp={defaults.background}>
      <View style={styles.paymentScreenContainer}>
        <View
          style={{
            alignItems: "center",
            width: "100%",
          }}
        >
          <View>
            <Text
              style={{
                fontSize: 60,
                color: "#59C092",
                fontWeight: "bold",
                textShadowOffset: { width: 2, height: 2 },
                textShadowColor: "rgba(0, 0, 0, 0.2)",
                textShadowRadius: 10,
              }}
            >
              {normalizeCurrency().parsedForUI}
            </Text>
          </View>
          <View style={{ flexDirection: "row", paddingVertical: 10 }}>
            <Text
              style={{
                fontSize: 12,
                fontWeight: "600",
                color: "gray",
                paddingRight: 4,
              }}
            >
              "Plus ~3% service charge"
            </Text>
            <Pressable onPress={() => setShowInfoIcon(true)}>
              <FontAwesomeIcon size={16} color="gray" icon={faInfoCircle} />
            </Pressable>
          </View>
          <View style={styles.donationTabs}>
            <Pressable
              onPress={() => handlePreselectedAmountClick(5)}
              style={{
                backgroundColor:
                  preselectedInputAmount[5] === 5 ? "#59C092" : "white",
                borderBottomLeftRadius: 100,
                borderTopLeftRadius: 100,
                ...styles.donationTab,
              }}
            >
              <View>
                <Text
                  style={{
                    color: preselectedInputAmount[5] === 5 ? "white" : "gray",
                  }}
                >
                  $5
                </Text>
              </View>
            </Pressable>
            <Pressable
              onPress={() => handlePreselectedAmountClick(10)}
              style={{
                ...styles.donationTab,
                backgroundColor:
                  preselectedInputAmount[10] === 10 ? "#59C092" : "white",
              }}
            >
              <View>
                <Text
                  style={{
                    color: preselectedInputAmount[10] === 10 ? "white" : "gray",
                  }}
                >
                  $10
                </Text>
              </View>
            </Pressable>
            <Pressable
              onPress={() => handlePreselectedAmountClick(20)}
              style={{
                backgroundColor:
                  preselectedInputAmount[20] === 20 ? "#59C092" : "white",
                ...styles.donationTab,
              }}
            >
              <View>
                <Text
                  style={{
                    color: preselectedInputAmount[20] === 20 ? "white" : "gray",
                  }}
                >
                  $20
                </Text>
              </View>
            </Pressable>
            <Pressable
              onPress={() => handlePreselectedAmountClick()}
              style={{
                ...styles.donationTab,
                backgroundColor:
                  preselectedInputAmount["other"] === "other"
                    ? "#59C092"
                    : "white",
                borderBottomRightRadius: 100,
                borderTopRightRadius: 100,
              }}
            >
              <View>
                <Text
                  style={{
                    color:
                      preselectedInputAmount["other"] === "other"
                        ? "white"
                        : "gray",
                  }}
                >
                  Other
                </Text>
              </View>
            </Pressable>
          </View>
          <CustomInputModal
            ref={textInputRef}
            showModal={showCustomAmountInput}
            setShowModal={setShowCustomAmountInput}
            onSelectedAmount={setSelectedAmount}
            handlePaymentVerified={setVerifiedPaymentAmount}
          />
          <View style={{ alignItems: "center", marginTop: 30 }}>
            <Pressable
              onPress={
                Platform.OS === "ios" ? buyWithApplePay : buyWithGooglePay
              }
              className="py-2"
            >
              {Platform.OS === "ios" ? (
                <View className="bg-black flex-row justify-center items-center bold px-4 py-2 rounded-full w-72">
                  <Icon icon="appleIcon" size={25} />
                  <Text className="text-white text-3xl pl-3">Pay</Text>
                </View>
              ) : (
                <View className="bg-black flex-row justify-center items-center bold px-4 py-2 rounded-full w-72">
                  <Icon icon="googleIcon" size={25} />
                  <Text className="text-white text-3xl pl-3">Pay</Text>
                </View>
              )}
            </Pressable>
            <PrimaryButton
              onPress={buyWithCard}
              text="Pay with card"
              disabled={!ready}
              color="white"
            />
            <SecondaryButton
              onPress={() => navigate("Wallet")}
              text="Go Back"
              color="black"
              backgroundColor="transparent"
            />
          </View>
        </View>
      </View>
      {showInfoIcon && (
        <BottomSheetModalComponent handleClose={handleCloseInfoIcon}>
          <View style={{ alignItems: "center", paddingHorizontal: 10 }}>
            <View style={{ paddingHorizontal: 4 }}>
              <Text className="pb-2">
                You will be charged{" "}
                <Text className="font-bold">2.9% plus 30 cents</Text> each time
                you load money onto your Trailbucks card. For example, if you
                load <Text className="font-bold">$5.00</Text> on your Traibucks
                on your virtual card, you will actually pay{" "}
                <Text className="font-bold">$5.46</Text>. Once money is loaded
                on your Trailbucks card, you will only pay the platform fee
                associated with building and maintaining Trailfunds, which is
                10%.
              </Text>
              <Text className="pb-2">
                Preloading money or "Trailbucks" on your virtual card will
                ensure Trail Organizations recieve more of your donation and you
                will pay less fees per donation.
              </Text>
            </View>
          </View>
        </BottomSheetModalComponent>
      )}
    </MainLayout>
  );
};

const styles = StyleSheet.create({
  paymentScreenContainer: {
    alignItems: "center",
  },
  payButton: {
    borderRadius: 100,
    paddingVertical: 24,
    marginVertical: 10,
    top: 0.5,
    maxWidth: "80%",
    width: 271,
  },
  donationTab: {
    paddingVertical: 16,
    paddingHorizontal: 26,
  },
  donationTabs: {
    width: 271,
    marginTop: 30,
    justifyContent: "center",
    flexDirection: "row",
    borderTopRightRadius: 100,
    borderTopLeftRadius: 100,
    borderBottomRightRadius: 100,
    borderBottomLeftRadius: 100,
    elevation: 5,
    shadowColor: "rgba(0, 0, 0, 0.1)",
    shadowOpacity: 0.8,
    shadowRadius: 6,
    shadowOffset: {
      height: 1,
      width: 1,
    },
  },
  paymentHeaderText: {
    fontWeight: "bold",
    fontSize: 24,
    textAlign: "center",
  },
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
  screen: {
    alignSelf: "stretch",
    flexGrow: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  productRow: {
    paddingVertical: 24,
    paddingHorizontal: 8,
    borderBottomWidth: 1,
    width: "75%",
  },
  buyButton: {
    backgroundColor: "#007DFF",
    paddingHorizontal: 32,
    paddingVertical: 16,
    borderRadius: 8,
  },
  textButton: {
    paddingHorizontal: 32,
    paddingVertical: 16,
    borderRadius: 8,
    color: "#007DFF",
  },
  selectButton: {
    borderColor: "#007DFF",
    paddingHorizontal: 32,
    paddingVertical: 16,
    borderRadius: 8,
    borderWidth: 2,
  },
  boldText: {
    fontSize: 17,
    fontWeight: "700",
  },
});
