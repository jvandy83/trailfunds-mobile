import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react';

import { fetchToken } from '../../reduxStore/features/auth/authSlice';

const unProtectedRoutesOrRefreshRoutes = [
	'user/refresh-token',
	'user/sign-up',
	'user/login',
];

const isProtectedRoute = (endpoint) =>
	!unProtectedRoutesOrRefreshRoutes.includes(endpoint);

const baseQuery = fetchBaseQuery({
	baseUrl: 'https://trailfunds.ngrok.dev/api/v1',
	prepareHeaders: async (headers, { getState, endpoint }) => {
		const user = getState().auth.currentUser;
		const accessToken = await fetchToken('accessToken');
		console.log('*** user *** : ', user);
		if (user && isProtectedRoute(endpoint)) {
			console.log('adding auth token');
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
		updateUser: build.mutation({
			query: ({ id, ...patch }) => ({
				url: `users/${id}`,
				method: 'PUT',
				body: patch,
			}),
			async onQueryStarted({ id, ...patch }, { dispatch, queryFulfilled }) {
				const patchResult = dispatch(
					api.util.updateQueryData('getUser', id, (draft) => {
						Object.assign(draft, patch);
					}),
				);
				try {
					await queryFulfilled;
				} catch {
					patchResult.undo();
				}
			},
			invalidatesTags: (result, error, { id }) => [{ type: 'Post', id }],
		}),
		deleteUser: build.mutation({
			query(id) {
				return {
					url: `user/${id}`,
					method: 'DELETE',
				};
			},
		}),
	}),
});

export const {
	useGetUserQuery,
	useUpdateUserMutation,
	useDeleteUserMutation,
	useLoginMutation,
	useSignUpMutation,
} = api;
