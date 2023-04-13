import { baseApi } from '../base';

export const userApi = baseApi.injectEndpoints({
	reducerPath: 'userApi',
	overrideExisting: true,
	refetchOnMountOrArgChange: true,
	endpoints: (build) => ({
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

export const { useGetUserQuery, useUpdateUserMutation, useDeleteUserMutation } =
	userApi;
