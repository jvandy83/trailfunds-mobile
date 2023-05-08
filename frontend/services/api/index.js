import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react';

import { fetchToken } from '../../reduxStore/features/auth/authSlice';

import { baseUrl } from '../../config';

const unProtectedRoutesOrRefreshRoutes = [
	'user/refresh-token',
	'user/sign-up',
	'user/login',
];

const isProtectedRoute = (endpoint) =>
	!unProtectedRoutesOrRefreshRoutes.includes(endpoint);

const baseQuery = fetchBaseQuery({
	baseUrl: baseUrl,
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

export const api = createApi({
	baseQuery: baseQueryWithReauth,
	tagTypes: ['Trailbucks'],
	endpoints: (build) => ({
		login: build.mutation({
			query: (body) => ({
				url: `auth/login`,
				method: 'POST',
				body,
			}),
		}),
		signUp: build.mutation({
			query: (body) => ({
				url: `auth/sign-up`,
				method: 'POST',
				body,
			}),
		}),
		getUser: build.query({
			query: () => `users/me`,
		}),
		getTrailsNearMe: build.query({
			query: (arg) => {
				const { lat, lon, radius } = arg;
				return {
					url: `trails/near-me?lat=${lat}&lon=${lon}&radius=${radius}`,
				};
			},
		}),
		getDistanceFromMe: build.query({
			query: (arg) => {
				const { nearLat, nearLon, farLat, farLon } = arg;
				return {
					url: `trails/distance-from-me?nearLat=${nearLat}&nearLon=${nearLon}&farLat=${farLat}&farLon=${farLon}`,
				};
			},
		}),
		getRadiusPushNotification: build.query({
			query: (arg) => {
				const { lat, lon, radius, token, message } = arg;
				return {
					url: `trails/radius-push-notification?lat=${lat}&lon=${lon}&radius=${radius}&token=${token}&message=${message}`,
				};
			},
		}),
		searchTrails: build.query({
			query: ({ query }) => `trails/search-trails?query=${query}`,
		}),
		getTrail: build.query({
			query: (arg) => `trails/get-trail?trailId=${arg}`,
		}),
		getCurrentBalance: build.query({
			query: () => `current-balance`,
			providesTags: (result, error) => [
				{ type: 'Trailbucks', id: 'CURRENT_BALANCE' },
			],
		}),
		getTransactions: build.query({
			query: () => `transactions`,
			providesTags: (result, error) => [
				{ type: 'Trailbucks', id: 'CURRENT_BALANCE' },
			],
		}),
		getTransaction: build.query({
			query: (transactionId) => `transaction/${transactionId}`,
			providesTags: (result, error) => [
				{ type: 'Trailbucks', id: 'CURRENT_BALANCE' },
			],
		}),
		addTrailbucks: build.mutation({
			query: ({ userId, amount }) => {
				return {
					url: `trailbucks`,
					method: 'POST',
					body: { amount, userId },
				};
			},
			invalidatesTags: [{ type: 'Trailbucks', id: 'CURRENT_BALANCE' }],
		}),
		donate: build.mutation({
			query: ({ userId, amount = 1, trailId }) => {
				return {
					url: `donate`,
					method: 'POST',
					body: { amount, userId, trailId },
				};
			},
			invalidatesTags: [{ type: 'Trailbucks', id: 'CURRENT_BALANCE' }],
		}),
	}),
});

export const {
	useGetUserQuery,
	useGetTrailsNearMeQuery,
	useGetTransactionsQuery,
	useGetTransactionQuery,
	useGetRadiusPushNotificationQuery,
	useLazySearchTrailsQuery,
	useGetTrailQuery,
	useGetCurrentBalanceQuery,
	useGetDistanceFromMeQuery,
	useLoginMutation,
	useSignUpMutation,
	useAddTrailbucksMutation,
	useDonateMutation,
} = api;
