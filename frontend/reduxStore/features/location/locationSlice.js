import { createAsyncThunk, createSlice } from '@reduxjs/toolkit';

export const locationSlice = createSlice({
	name: 'location',
	initialState: {
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
	},
});

// Action creators are generated for each case reducer function
export const { setLocation, setInitialLocation } = locationSlice.actions;

export default locationSlice.reducer;
