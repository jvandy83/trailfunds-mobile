import React from "react";

import {
  StyleSheet,
  Modal,
  View,
  Text,
  TextInput,
  Pressable,
} from "react-native";

export const CustomInputModal = React.forwardRef(
  (
    { showModal, setShowModal, onSelectedAmount, handlePaymentVerified },
    ref
  ) => {
    const handleInitiatePaymentIntent = () => {
      handlePaymentVerified(true);
      setShowModal(!showModal);
    };
    return (
      <Modal
        transparent={true}
        animationType="fade"
        visible={showModal}
        onRequestClose={() => {
          setShowModal(!showModal);
        }}
      >
        <Pressable style={{ flex: 1 }} onPress={() => setShowModal(false)}>
          <View style={styles.centeredView}>
            <View style={styles.modalView}>
              <Text style={styles.modalText}>Enter a custom amount</Text>
              <View
                style={{
                  flexDirection: "row",
                  alignItems: "center",
                  position: "relative",
                }}
              >
                <Text
                  style={{
                    position: "absolute",
                    fontSize: 18,
                    top: 28,
                    right: 75,
                    fontWeight: "600",
                  }}
                >
                  $
                </Text>
                <TextInput
                  ref={ref}
                  keyboardType="numeric"
                  onChangeText={(value) =>
                    onSelectedAmount((prev) => ({
                      ...prev,
                      customAmount: value,
                    }))
                  }
                  style={styles.input}
                />
              </View>
              <Pressable
                style={[styles.button, styles.buttonClose]}
                onPress={handleInitiatePaymentIntent}
              >
                <Text style={styles.textStyle}>Confirm</Text>
              </Pressable>
            </View>
          </View>
        </Pressable>
      </Modal>
    );
  }
);

const styles = StyleSheet.create({
  input: {
    textAlign: "center",
    width: 70,
    padding: 10,
    marginTop: 20,
    marginBottom: 10,
    backgroundColor: "#e8e8e8",
    borderRadius: 6,
  },
  centeredView: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    marginTop: 22,
  },
  modalView: {
    backgroundColor: "white",
    borderRadius: 12,
    padding: 20,
    alignItems: "center",
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 4,
    elevation: 5,
  },
  button: {
    marginTop: 20,
    borderRadius: 100,
    paddingVertical: 10,
    paddingHorizontal: 20,
    elevation: 2,
  },
  buttonOpen: {
    backgroundColor: "#F194FF",
  },
  buttonClose: {
    backgroundColor: "#2196F3",
  },
  textStyle: {
    color: "white",
    fontWeight: "bold",
    textAlign: "center",
  },
  modalText: {
    marginBottom: 15,
    textAlign: "center",
  },
});
