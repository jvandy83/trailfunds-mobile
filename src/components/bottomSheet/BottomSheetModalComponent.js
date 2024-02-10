import { useRef, useEffect, useCallback, useMemo } from "react";

import { View, Pressable } from "react-native";

import { FontAwesomeIcon } from "@fortawesome/react-native-fontawesome";

import { faClose } from "@fortawesome/free-solid-svg-icons";

import {
  BottomSheetModal,
  BottomSheetModalProvider,
  BottomSheetBackdrop,
} from "@gorhom/bottom-sheet";
import { useFocusEffect } from "@react-navigation/native";

export const BottomSheetModalComponent = ({ children, handleClose }) => {
  const bottomSheetModalRef = useRef(null);
  const handleSheetChanges = useCallback((index) => {
    // this keeps modal from closing all the way
    // and leaving the screen
    bottomSheetModalRef.current?.present();
  }, []);

  const snapPoints = useMemo(() => ["30%", "60%"], []);

  const handleModalClose = () => {
    bottomSheetModalRef.current?.dismiss();
    setTimeout(() => {
      handleClose();
    }, 300);
  };

  const renderBackdrop = useCallback(
    (props) => <BottomSheetBackdrop {...props} onPress={handleModalClose} />,
    []
  );

  useEffect(() => {
    bottomSheetModalRef.current?.present();
  }, []);

  return (
    <BottomSheetModalProvider>
      <View>
        <BottomSheetModal
          ref={bottomSheetModalRef}
          index={1}
          snapPoints={snapPoints}
          onChange={handleSheetChanges}
          backdropComponent={renderBackdrop}
        >
          <View
            style={{
              paddingVertical: 6,
              paddingHorizontal: 4,
            }}
          >
            <View style={{ paddingLeft: 10, marginBottom: 40 }}>
              <Pressable onPress={handleModalClose}>
                <FontAwesomeIcon size={24} icon={faClose} />
              </Pressable>
            </View>
            {children}
          </View>
        </BottomSheetModal>
      </View>
    </BottomSheetModalProvider>
  );
};
