declare namespace NodeJS {
  interface ProcessEnv {
    // Declare your environment variables here
    EXPO_PUBLIC_BASE_URL: string;
    EXPO_PUBLIC_AUTH0_DOMAIN: string;
    EXPO_PUBLIC_AUTH0_CLIENT_ID: string;
    EXPO_PUBLIC_MERCHANT_IDENTIFIER: string;
    EXPO_PUBLIC_STRIPE_API_KEY: string;
    // Add more environment variables as needed
  }
}
