import React, { useState, Dispatch, SetStateAction, useEffect } from "react";
import { Text, View, TextInput } from "react-native";

import { Controller, useForm } from "react-hook-form";

import { TextInputField } from "../text-input/TextInputField";

import { useAuth0 } from "react-native-auth0";

import { useCreateUserMutation } from "@/services/api";

import Modal from "react-native-modal";

import { showToast } from "@utils/toast";

import { PrimaryButton } from "@/reduxStore/styles/frontendStyles";

type ModalNewUserProps = {
  title: string;
  setIsModalVisible: Dispatch<SetStateAction<boolean>>;
  isVisible: boolean;
  setUserLoaded: Dispatch<SetStateAction<boolean>>;
};

type User = {
  firstName: string;
  lastName: string;
  email: string;
  auth0UserId: string;
};

export const NewUserFormModal = ({
  title,
  setIsModalVisible,
  isVisible,
  setUserLoaded,
}: ModalNewUserProps) => {
  const { user } = useAuth0();

  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");

  const [createUser, { isSuccess, isLoading }] = useCreateUserMutation();

  const {
    control,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm();

  const closeModal = () => {
    isSuccess && setIsModalVisible(!isVisible);
  };

  const onSubmit = (data: User) => {
    createUser({
      firstName: data.firstName,
      lastName: data.lastName,
      auth0UserId: user?.sub,
      email: user.email,
    })
      .unwrap()
      .then((payload) => {
        setUserLoaded(true);
        setIsModalVisible(!isVisible);
      })
      .catch((error) => {
        console.log("There was an error creating a user");
        console.error(error);
      });
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
      <View className="h-3/4 w-full rounded-xl bg-white px-4 pt-20 text-left">
        <View className="">
          <Text className="text-center font-primary-500 text-xl text-zinc-800 pb-10">
            {title}
          </Text>
          <View>
            <TextInputField
              fieldName="firstName"
              errors={errors}
              placeholder="First Name"
              onChangeText={setFirstName}
              control={control}
              rules={{ required: true }}
            />
            <TextInputField
              fieldName="lastName"
              errors={errors}
              placeholder="Last Name"
              onChangeText={setLastName}
              control={control}
              rules={{ required: true }}
            />
            <View className="items-center">
              <PrimaryButton
                text="Submit"
                onPress={handleSubmit(onSubmit)}
                color="white"
                disabled={false}
              />
            </View>
          </View>
        </View>
      </View>
    </Modal>
  );
};
