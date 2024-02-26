import { useState, useRef, useEffect } from "react";
import { View, Text, StyleSheet, Pressable } from "react-native";

import { useNavigation } from "@react-navigation/native";

import {
  useGetTrailQuery,
  useGetUserQuery,
  useDonateMutation,
} from "../services/api";

import { CustomInputModal } from "@components/modal/CustomInputModal";

import { MainLayout } from "@components/layout/MainLayout";

import { SecondaryButton } from "../reduxStore/styles/frontendStyles";
import { formatCurrency } from "@/utils/currencyFormatter";

const preselectedInputs = {
  5: 0,
  10: 0,
  20: 0,
  other: "",
};

export const Donate = ({ route }) => {
  const { trailId } = route.params;

  const { goBack, navigate } = useNavigation();

  /* ----> REFS <---- */
  const textInputRef = useRef(null);

  /* ----> LOCAL STATE <---- */

  const [showCustomAmountInput, setShowCustomAmountInput] = useState(false);

  const [verifiedPaymentAmount, setVerifiedPaymentAmount] = useState(false);

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

  const [transactionId, setTransactionId] = useState(null);

  const [errorMessage, setErrorMessage] = useState(null);

  // RTK Query

  const { data, isLoading, error } = useGetTrailQuery(trailId);

  const [donate, { isSuccess, isLoading: isDonationLoading, isUninitialized }] =
    useDonateMutation();

  // helper function
  //
  const normalizeCurrency = () => {
    const currency =
      amount.customAmount > 0 ? amount.customAmount : amount.selectAmount;
    const {
      parsedForUI,
      convertToPennies,
      convertToPenniesForDonation,
      parsedForUIDonation,
    } = formatCurrency(currency);
    return {
      parsedForUI,
      convertToPennies,
      convertToPenniesForDonation,
      parsedForUIDonation,
    };
  };

  /* ----> EVENT HANDLERS <---- */
  // modify local state to
  // control transaction flow

  const handleSubmitDonation = async () => {
    const donationAmount =
      amount.customAmount > 0 ? amount.customAmount : amount.selectAmount;
    try {
      const { data } = await donate({
        amount: normalizeCurrency(donationAmount).convertToPenniesForDonation,
        trailId,
      }).unwrap();
      const { transactionId, message } = data;
      setErrorMessage(message);
      setTransactionId(transactionId);
    } catch (error) {
      console.log("There was an error making a donation!!!");
      console.error(error);
    }
  };

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

  /* ----> USE EFFECTS <---- */

  useEffect(() => {
    if (textInputRef.current) {
      textInputRef.current.value = amount.customAmount || 0;
    }
  }, [amount.customAmount]);

  useEffect(() => {
    transactionId && navigate("Success", { transactionId });
  }, [transactionId]);

  if (isLoading) {
    return (
      <View>
        <Text>Loading...</Text>
      </View>
    );
  }

  if (error) {
    console.error(error);
  }

  return (
    <MainLayout
      styleProp={{
        width: "100%",
        height: "100%",
        alignItems: "center",
      }}
    >
      <View style={styles.paymentScreenContainer}>
        <View
          style={{
            alignItems: "center",
            width: "100%",
            paddingHorizontal: 16,
          }}
        >
          {errorMessage && (
            <Text className="text-red-500 text-lg bold">{errorMessage}</Text>
          )}
          <View>
            <Text
              style={{
                fontWeight: "bold",
                fontSize: 30,
                paddingVertical: 20,
                textAlign: "center",
              }}
            >
              {data.trail.name}
            </Text>
          </View>
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
              {normalizeCurrency().parsedForUIDonation}
            </Text>
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
                  className={
                    preselectedInputAmount[10] === 10
                      ? "text-white"
                      : "text-gray-500"
                  }
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
            <SecondaryButton
              disabled={!!errorMessage}
              onPress={handleSubmitDonation}
              text={`Donate ${normalizeCurrency().parsedForUIDonation}`}
            />
          </View>
          <View>
            <SecondaryButton
              backgroundColor="transparent"
              color="black"
              onPress={() => goBack()}
              text="Go Back"
            />
          </View>
        </View>
      </View>
    </MainLayout>
  );
};

const styles = StyleSheet.create({
  paymentScreenContainer: {
    paddingTop: "20%",
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
});
