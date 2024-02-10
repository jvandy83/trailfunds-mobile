//For the love of all that is holy do not put anything above this first import!
import "react-native-gesture-handler";
//Put imports below this. Please and thank you.

import { Auth0Provider } from "react-native-auth0";

import "expo-dev-client";

import { StripeProvider } from "@stripe/stripe-react-native";

import React from "react";

import { StackHome } from "./routeNavigation/stack"; //Importing the main stack of pages for the app

import { Provider } from "react-redux";
import { store } from "./reduxStore";

export default function App() {
  return (
    <StripeProvider
      merchantIdentifier={process.env.EXPO_PUBLIC_MERCHANT_IDENTIFIER}
      publishableKey={process.env.EXPO_PUBLIC_STRIPE_API_KEY}
    >
      <Auth0Provider
        domain={process.env.EXPO_PUBLIC_AUTH0_DOMAIN}
        clientId={process.env.EXPO_PUBLIC_AUTH0_CLIENT_ID}
      >
        <Provider store={store}>
          <StackHome />
        </Provider>
      </Auth0Provider>
    </StripeProvider>
  );
}
