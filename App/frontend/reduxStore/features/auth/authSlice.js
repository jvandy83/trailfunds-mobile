import { createSlice } from '@reduxjs/toolkit';

import * as SecureStore from 'expo-secure-store';

export const save = async (key, value) => {
	await SecureStore.setItemAsync(key, JSON.stringify(value));
};

export const fetchToken = async (key) => {
	let result = await SecureStore.getItemAsync(key);
	if (result) {
		alert("🔐 Here's your value 🔐 \n" + result);
		return result;
	} else {
		alert('No values stored under that key.');
		return null;
	}
};

const destroyToken = async (key) => {
	await SecureStore.deleteItemAsync(key);
};

const initialState = {
	acessToken: null,
	user: null,
	isLoggedIn: false,
};

export const authSlice = createSlice({
	name: 'auth',
	initialState,
	reducers: {
		setUser: (state, { payload }) => {
			state.acessToken = payload.accessToken;
			state.user = payload.currentUser;
			state.isLoggedIn = true;
		},
		loggedOut: (state, _) => {
			destroyToken();
			state.accessToken = null;
			state.user = null;
			state.isLoggedIn = false;
		},
		defaultState: (state) => {
			state = initialState;
		},
	},
});

// Action creators are generated for each case reducer function
export const { setUser, loggedOut, defaultState } = authSlice.actions;

export default authSlice.reducer;
