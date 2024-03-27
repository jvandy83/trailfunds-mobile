// PickerComponent.js
import React, { useMemo } from "react";
import { Picker } from "@react-native-picker/picker";

import uuid from "react-native-uuid";

export const PickerComponent = ({ selectedValue, onValueChange }) => {
  const renderPicker = () => {
    const arr = [];
    let i = 0;
    while (i < 50) {
      i++;
      arr.push(<Picker.Item key={uuid.v4()} label={i} value={i} />);
    }
    return arr;
  };

  const memoizedPickerItems = useMemo(() => renderPicker(), []);

  return (
    <Picker
      selectedValue={selectedValue}
      onValueChange={onValueChange}
      style={{ width: "50%" }}
    >
      {memoizedPickerItems}
    </Picker>
  );
};
