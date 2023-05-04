import { baseApi } from '../base';

export const authApi = baseApi.injectEndpoints({
	reducerPath: 'authApi',
	overrideExisting: true,
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
	}),
});

export const { useLoginMutation, useSignUpMutation } = authApi;
