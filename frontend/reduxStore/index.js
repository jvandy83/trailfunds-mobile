import { configureStore } from '@reduxjs/toolkit';
// Or from '@reduxjs/toolkit/query/react'
import { setupListeners } from '@reduxjs/toolkit/query';
import { api } from '../services/api';
import authReducer from '../reduxStore/features/auth/authSlice';
import locationReducer from '../reduxStore/features/location/locationSlice';

export const store = configureStore({
	reducer: {
		// Add the generated reducer as a specific top-level slice
		[api.reducerPath]: api.reducer,
		auth: authReducer,
		location: locationReducer,
	},
	// Adding the api middleware enables caching, invalidation, polling,
	// and other useful features of `rtk-query`.
	// TODO: figure out how to use multiple
	// api's to middleware
	middleware: (getDefaultMiddleware) =>
		getDefaultMiddleware().concat([api.middleware]),
});

// optional, but required for refetchOnFocus/refetchOnReconnect behaviors
// see `setupListeners` docs - takes an optional callback as the 2nd arg for customization
setupListeners(store.dispatch);
