import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react';
import { baseApi } from '../base';

export const authApi = createApi({
	reducerPath: 'authApi',
	baseQuery: fetchBaseQuery({
		baseUrl: 'https://trailfunds.ngrok.io/api/v1',
	}),
	endpoints: (build) => ({
		test: build.query({
			query: () => 'user/test',
		}),
		login: build.mutation({
			query: (body) => ({
				url: `user/login`,
				method: 'POST',
				body,
			}),
		}),
		signUp: build.mutation({
			query: (body) => ({
				url: `user/sign-up`,
				method: 'POST',
				body,
			}),
		}),
		getUser: build.query({
			query: (id) => `user/${id}`,
		}),
		updateUser: build.mutation({
			query: ({ id, ...patch }) => ({
				url: `user/${id}`,
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
	useLoginMutation,
	useSignUpMutation,
	useGetUserQuery,
	useUpdateUserMutation,
	useDeleteUserMutation,
	useTestQuery,
} = authApi;
