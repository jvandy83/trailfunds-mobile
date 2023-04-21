import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react';
import { setAuth } from '../../reduxStore/features/auth/authSlice';

import { fetchToken, save } from '../../reduxStore/features/auth/authSlice';

const unProtectedRoutesOrRefresh = [
	'user/refresh-token',
	'user/sign-up',
	'user/login',
];

const isProtectedRoute = (endpoint) =>
	!unProtectedRoutesOrRefresh.includes(endpoint);

const baseQuery = fetchBaseQuery({
	baseUrl: 'https://trailfunds.ngrok.dev/api/v1',
	prepareHeaders: async (headers, { getState, endpoint }) => {
		const user = getState().auth.currentUser;
		const accessToken = await fetchToken('accessToken');
		if (user && isProtectedRoute(endpoint)) {
			headers.set('Authorization', `Bearer ${accessToken}`);
		}
		return headers;
	},
});

const baseQueryWithReauth = async (args, api, extraOptions) => {
	let result = await baseQuery(args, api, extraOptions);
	// if (result.error && result.error.status === 401) {
	// 	// try to get a new token
	// 	const refreshResult = await baseQuery(
	// 		'user/refresh-token',
	// 		api,
	// 		extraOptions,
	// 	);
	// 	if (refreshResult.data) {
	// 		// store the new token
	// 		save(refreshResult.data);
	// 		// retry the initial query
	// 		result = await baseQuery(args, api, extraOptions);
	// 	} else {
	// 		api.dispatch(loggedOut());
	// 	}
	// }
	return result;
};

// initialize an empty api service that we'll inject endpoints into later as needed
export const baseApi = createApi({
	baseQuery: baseQueryWithReauth,
	endpoints: () => ({}),
});
// export const baseApi = createApi({
// 	baseQueryWithReauth,
// 	endpoints: () => ({}),
// });
