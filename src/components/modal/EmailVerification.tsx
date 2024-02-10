import React from "react";
import { Text, View } from "react-native";

import { useAuth0 } from "react-native-auth0";

import axios from "axios";

type ModalEmailVerificationProps = {
  title: string;
  setIsModalVisible: (arg: boolean) => void;
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
  const closeModal = () => {
    emailVerified && setIsModalVisible(!isVisible);
  };

  const handleResendVerification = async () => {
    const { getCredentials } = useAuth0();

    const credentials = await getCredentials();
    try {
      const { data } = await axios.get(
        `${process.env.EXPO_PUBLIC_BASE_URL}/users/resend-verification-email`,
        {
          headers: {
            Authorization: `Bearer ${credentials?.idToken}`,
          },
        }
      );
      const { message } = data;
      showToast({
        message,
        severity: "success",
      });
    } catch (error) {
      Sentry.captureException(error);
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
      className="m-0 justify-end"
    >
      <View className="h-3/4 w-full items-center justify-between rounded-xl bg-white-100 px-4 pt-20 text-left">
        <View className="items-center">
          <View className="flex w-full flex-row items-center justify-between pb-5">
            <Text className="text-center font-primary-500 text-xl text-zinc-800">
              {title}
            </Text>
          </View>
          <View>
            <Text>
              We sent an email verification to{" "}
              <Text className="font-primary-700">{user.email}</Text>. Please
              verify your email in order to continue.
            </Text>
          </View>
        </View>
        <View className="flex w-full pb-20">
          <View className="pb- w-full px-4 pb-4">
            <Button text="Continue" onPress={handleCheckEmailVerified} />
          </View>
          <View className="w-full px-4 pb-10">
            <Button
              text="Resend verification"
              onPress={handleResendVerification}
            />
          </View>
        </View>
      </View>
    </Modal>
  );
};
