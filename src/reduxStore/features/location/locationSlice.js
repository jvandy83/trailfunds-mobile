import { createSlice } from "@reduxjs/toolkit";

export const locationSlice = createSlice({
  name: "location",
  initialState: {
    radius: 5,
    location: {},
    initialLocation: {},
  },
  reducers: {
    setLocation: (state, { payload }) => {
      state.location = payload;
    },
    setInitialLocation: (state, { payload }) => {
      state.initialLocation = payload;
    },
    setRadius: (state, { payload }) => {
      state.radius = payload;
    },
  },
});

// Action creators are generated for each case reducer function
export const { setLocation, setInitialLocation, setRadius } =
  locationSlice.actions;

export default locationSlice.reducer;
