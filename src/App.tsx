//For the love of all that is holy do not put anything above this first import!
import "react-native-gesture-handler";
//Put imports below this. Please and thank you.

import { Auth0Provider } from "react-native-auth0";

import * as Sentry from "@sentry/react-native";

import "expo-dev-client";

import "../global.css";

import { StripeProvider } from "@stripe/stripe-react-native";

import React from "react";

import { StackHome } from "./routeNavigation/stack"; //Importing the main stack of pages for the app

import { Provider } from "react-redux";
import { store } from "./reduxStore";

import { FontFamily } from "./theme";

import { useFonts } from "expo-font";

Sentry.init({
  dsn: process.env.EXPO_PUBLIC_SENTRY_DSN,
  // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
  // We recommend adjusting this value in production.
  environment: process.env.NODE_ENV,
  tracesSampleRate: 1.0,
});

// Sentry.captureException(new Error("First error"));

function App() {
  const [fontsLoaded] = useFonts(FontFamily.fontsConfig);
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

export default Sentry.wrap(App);
