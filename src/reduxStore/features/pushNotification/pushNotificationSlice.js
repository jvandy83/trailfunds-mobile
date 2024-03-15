// import { createAsyncThunk, createSlice } from '@reduxjs/toolkit';

// import { fetchPushToken } from '../../../api/pushNotifications/usePushToken';

// import * as SecureStore from 'expo-secure-store';

// export const saveToken = async (key, value) => {
// 	await SecureStore.setItemAsync(key, JSON.stringify(value));
// };

// export const fetchToken = async (key) => {
// 	let result = await SecureStore.getItemAsync(key);
// 	if (result) {
// 		return JSON.parse(result);
// 	} else {
// 		return null;
// 	}
// };

// export const destroyToken = async (key) => {
// 	await SecureStore.deleteItemAsync(key);
// };

// export const pushNotificationSlice = createSlice(
// 	{
// 		name: 'pushNotification',
// 		initialState: fetchPushToken() || {},
// 		reducers: {},
// 	},
	
// );

// export default pushNotificationSlice.reducer;
