import React, { useState, Dispatch, SetStateAction, useEffect } from "react";
import { Text, View, TextInput } from "react-native";

import { useForm } from "react-hook-form";

import { TextInputField } from "../text-input/TextInputField";

import { useUpdateTrailOrgMutation } from "@/services/api";

import Modal from "react-native-modal";

import { showToast } from "@utils/toast";

import { PrimaryButton } from "@/reduxStore/styles/frontendStyles";

type ModalTrailOrgsProps = {
  title: string;
  setIsModalVisible: Dispatch<SetStateAction<boolean>>;
  isVisible: boolean;
};

interface TrailOrg {
  name: string;
  contacts: [];
  address: {
    street: string;
    city: string;
    zipcode: string;
  };
  phoneNumber: string;
  email: string;
}

export const TrailOrgSourcingModal = ({
  title,
  setIsModalVisible,
  isVisible,
}: ModalTrailOrgsProps) => {
  const [name, setName] = useState("");
  const [address, setAddress] = useState({
    street: "",
    city: "",
    zipcode: "",
  });
  const [phoneNumber, setPhoneNumber] = useState("");
  const [contact, setContact] = useState("");
  const [email, setEmail] = useState("");

  const [updateTrailOrg, { isSuccess, isLoading }] =
    useUpdateTrailOrgMutation();

  const {
    control,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm();

  const closeModal = () => {
    setIsModalVisible(!isVisible);
  };

  const onSubmit = (data: TrailOrg) => {
    updateTrailOrg(data);
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
              fieldName="name"
              label={name}
              errors={errors}
              placeholder="Trail Org Name"
              onChangeText={setName}
              control={control}
              rules={{ required: true }}
            />
            <TextInputField
              fieldName="phoneNumber"
              label={phoneNumber}
              errors={errors}
              placeholder="Trail Org phone #"
              onChangeText={setPhoneNumber}
              control={control}
            />
            <TextInputField
              label={contact}
              fieldName="contact"
              errors={errors}
              control={control}
              placeholder="Person in charge"
              onChangeText={setContact}
            />
            <TextInputField
              label={email}
              fieldName="email"
              errors={errors}
              control={control}
              placeholder="Trail Org email"
              onChangeText={setEmail}
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
