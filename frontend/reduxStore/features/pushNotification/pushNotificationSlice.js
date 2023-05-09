import { createAsyncThunk, createSlice } from '@reduxjs/toolkit';

import { fetchPushToken } from '../../../api/pushNotifications/usePushToken';

import * as SecureStore from 'expo-secure-store';

export const saveToken = async (key, value) => {
	await SecureStore.setItemAsync(key, JSON.stringify(value));
};

export const fetchToken = async (key) => {
	let result = await SecureStore.getItemAsync(key);
	if (result) {
		return JSON.parse(result);
	} else {
		return null;
	}
};

export const destroyToken = async (key) => {
	await SecureStore.deleteItemAsync(key);
};

export const pushNotificationSlice = createSlice(
	{
		name: 'pushNotification',
		initialState: fetchPushToken() || {},
		reducers: {},
	},
	// extraReducers: (builder) => {
	// 	// Add reducers for additional action types here, and handle loading state as needed
	// 	builder.addCase(logoutUser.fulfilled, (state, action) => {
	// 		// Add user to the state array
	// 		state.currentUser = null;
	// 		state.isLoggedIn = false;
	// 	});
	// },
);

// Action creators are generated for each case reducer function
// export const { setPushToken } = pushNotificationSlice.actions;

export default pushNotificationSlice.reducer;
