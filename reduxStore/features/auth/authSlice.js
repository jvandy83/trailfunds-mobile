import { createAsyncThunk, createSlice } from '@reduxjs/toolkit';

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

export const logoutUser = createAsyncThunk(
	'users/logout',
	async (_, thunkApi) => {
		try {
			await destroyToken('accessToken');
		} catch (error) {
			console.error(error);
			// throw new Error('Error occurred while logging out');
		}
	},
);

const initialState = {
	acessToken: null,
	currentUser: null,
	isLoggedIn: false,
};

export const authSlice = createSlice({
	name: 'users',
	initialState,
	reducers: {
		setAuth: (state, { payload }) => {
			state.currentUser = payload.currentUser;
			state.isLoggedIn = true;
		},
		loggedOut: (state, _) => {
			state.currentUser = null;
			state.isLoggedIn = false;
		},
		defaultState: (state) => {
			state = initialState;
		},
	},
	extraReducers: (builder) => {
		// Add reducers for additional action types here, and handle loading state as needed
		builder.addCase(logoutUser.fulfilled, (state, action) => {
			// Add user to the state array
			state.currentUser = null;
			state.isLoggedIn = false;
		});
	},
});

// Action creators are generated for each case reducer function
export const { setAuth, loggedOut, defaultState } = authSlice.actions;

export default authSlice.reducer;
