import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react';
import { setAuth } from '../../reduxStore/features/auth/authSlice';

const baseQuery = fetchBaseQuery({
	baseUrl: 'https://trailfunds.ngrok.io/api/v1',
	prepareHeaders: (headers, { getState, endpoint }) => {
		const user = getState().auth.currentUser;

		if (user && endpoint !== 'user/refresh-token') {
			headers.set('Authorization', `Bearer ${user.accessToken}`);
		}
		return headers;
	},
	credentials: 'include',
});

const baseQueryWithReauth = async (args, api, extraOptions) => {
	let result = await baseQuery(args, api, extraOptions);
	if (result.error && result.error.status === 401) {
		// try to get a new token
		const refreshResult = await baseQuery(
			'user/refresh-token',
			api,
			extraOptions,
		);
		if (refreshResult.data) {
			// store the new token
			api.dispatch(setUser(refreshResult.data));
			// retry the initial query
			result = await baseQuery(args, api, extraOptions);
		} else {
			api.dispatch(loggedOut());
		}
	}
	return result;
};

// initialize an empty api service that we'll inject endpoints into later as needed
export const baseApi = createApi({
	baseQuery: fetchBaseQuery({
		baseUrl: 'https://trailfunds.ngrok.io/api/v1',
	}),
	endpoints: () => ({}),
});
// export const baseApi = createApi({
// 	baseQueryWithReauth,
// 	endpoints: () => ({}),
// });
