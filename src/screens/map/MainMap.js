// MainMap.js
import React, { useState } from "react";
import { Map } from "./Map";
import { TrailDataBottomSheet } from "./TrailDataBottomSheet";

export const MainMap = () => {
  const [selectedRadiusValue, setSelectedRadiusValue] = useState(5);

  const handleRadiusChange = (value, idx) => {
    setSelectedRadiusValue(value);
  };

  return (
    <>
      <Map selectedRadiusValue={selectedRadiusValue} />
      <TrailDataBottomSheet
        selectedRadiusValue={selectedRadiusValue}
        onRadiusChange={handleRadiusChange}
      />
    </>
  );
};
