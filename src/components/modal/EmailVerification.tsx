import React, { Dispatch, SetStateAction } from "react";
import { Text, View } from "react-native";

import { useAuth0 } from "react-native-auth0";

import Modal from "react-native-modal";

import { useResendEmailVerificationMutation } from "@services/api";

import { showToast } from "@utils/toast";

import axios from "axios";

import { PrimaryButton } from "@/reduxStore/styles/frontendStyles";

type ModalEmailVerificationProps = {
  title: string;
  setIsModalVisible: Dispatch<SetStateAction<boolean>>;
  isVisible: boolean;
  emailVerified: boolean;
  handleCheckEmailVerified: () => void;
};

export const ModalEmailVerification = ({
  title,
  setIsModalVisible,
  isVisible,
  emailVerified,
  handleCheckEmailVerified,
}: ModalEmailVerificationProps) => {
  const { user, getCredentials } = useAuth0();

  const [
    resendEmailVerfication,
    {
      isSuccess,
      isLoading: resendEmailVerificationLoading,
      error: resendEmailVerficationError,
    },
  ] = useResendEmailVerificationMutation();

  const closeModal = () => {
    emailVerified && setIsModalVisible(!isVisible);
  };

  const handleResendVerification = async () => {
    try {
      const { data } = await axios.post(
        `https://${process.env.EXPO_PUBLIC_AUTH0_MANAGEMENT_API}/jobs/verification-email`,
        {
          user_id: user?.sub,
        },
        {
          headers: {
            Authorization: `Bearer ${process.env.EXPO_PUBLIC_AUTH0_MANAGEMENT_API_KEY}`,
          },
        }
      );
      console.log("DATA FROM RESEND EMAIL VERIFICATION: ", data);
      // const { message } = data;
      // showToast({
      //   message,
      //   severity: "success",
      // });
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <Modal
      isVisible={isVisible}
      propagateSwipe
      animationIn={"slideInUp"}
      swipeDirection={"down"}
      onSwipeComplete={closeModal}
      onBackdropPress={closeModal}
      onBackButtonPress={closeModal}
    >
      <View className="h-3/4 w-full items-center justify-between rounded-xl bg-white px-4 pt-20 text-left">
        <View className="items-center">
          <View className="flex w-full flex-row pb-5">
            <Text className="text-center font-primary-500 text-xl text-zinc-800">
              {title}
            </Text>
          </View>
          <View>
            <Text className="font-primary-300">
              We sent an email verification to{" "}
              <Text className="font-primary-700">{user.email}</Text>. Please
              verify your email in order to continue.
            </Text>
          </View>
        </View>
        <View className="flex pb-20 w-full items-center">
          <PrimaryButton
            text="Continue"
            onPress={handleCheckEmailVerified}
            color="white"
            disabled={undefined}
          />
          <PrimaryButton
            text="Resend verification"
            onPress={handleResendVerification}
            color="white"
            disabled={undefined}
          />
        </View>
      </View>
    </Modal>
  );
};
