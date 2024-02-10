import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

import { sec } from "../../hooks/useToken";

const baseUrl = process.env.EXPO_PUBLIC_BASE_URL;

const withAuth = (token) => {
  return {
    Authorization: `Bearer ${token}`,
  };
};

const baseQuery = fetchBaseQuery({
  baseUrl,
  prepareHeaders: async (headers, _) => {
    const { idToken } = await sec.getAccessToken()();
    if (idToken) {
      headers.set("Authorization", `Bearer ${idToken}`);
    }
    return headers;
  },
});

const baseQueryWithReauth = async (args, api, extraOptions) => {
  let result = await baseQuery(args, api, extraOptions);
  return result;
};

export const api = createApi({
  baseQuery: baseQueryWithReauth,
  tagTypes: ["Trailbucks", "Notifications"],
  endpoints: (build) => ({
    me: build.query({
      query: () => `users/me`,
    }),
    createUser: build.mutation({
      query: (args) => {
        const { auth0UserId, email } = args;
        return {
          url: `users`,
          method: "POST",
          body: { auth0_user_id: auth0UserId, email },
        };
      },
    }),
    getUser: build.query({
      query: (auth0UserId) => `users/${auth0UserId}`,
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
        { type: "Trailbucks", id: "CURRENT_BALANCE" },
      ],
    }),
    getTransactions: build.query({
      query: () => `transactions`,
      providesTags: (result, error) => [
        { type: "Trailbucks", id: "CURRENT_BALANCE" },
      ],
    }),
    getTransaction: build.query({
      query: (transactionId) => `transaction/${transactionId}`,
      providesTags: (result, error) => [
        { type: "Trailbucks", id: "CURRENT_BALANCE" },
      ],
    }),
    addTrailbucks: build.mutation({
      query: (body) => {
        return {
          url: `trailbucks`,
          method: "POST",
          body,
        };
      },
      invalidatesTags: [{ type: "Trailbucks", id: "CURRENT_BALANCE" }],
    }),

    donate: build.mutation({
      query: ({ userId, amount = 1, trailId, idToken }) => {
        return {
          url: `donate`,
          method: "POST",
          body: { amount, userId, trailId },
        };
      },
      invalidatesTags: [{ type: "Trailbucks", id: "CURRENT_BALANCE" }],
    }),
    setNotificationEnabled: build.mutation({
      query: (trailId) => {
        return {
          url: `trail/notification-enabled`,
          method: "POST",
          body: { trailId },
        };
      },
      invalidatesTags: [{ type: "Notifications" }],
    }),
    addSubscription: build.mutation({
      query: (productId) => {
        return {
          url: `create-checkout-session`,
          method: "POST",
          body: { productId },
        };
      },
    }),
    createPortalSession: build.mutation({
      query: (sessionId) => {
        return {
          url: `create-portal-session`,
          method: "POST",
          body: { sessionId },
        };
      },
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
  useCreateUserMutation,
  useAddSubscriptionMutation,
  useCreatePortalSessionMutation,
  useAddTrailbucksMutation,
  useDonateMutation,
  useSetNotificationEnabledMutation,
} = api;
