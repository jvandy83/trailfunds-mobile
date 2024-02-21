/** @type {import('tailwindcss').Config} */

module.exports = {
  content: [
    "./src/App.{js,jsx,ts,tsx}",
    "./src/screens/**/*.{js,jsx,ts,tsx}",
    "./src/components/**/*.{js,jsx,ts,tsx}",
    "./src/theme/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        "warning-red": "#c32f27",
        red: "#dd3333",
      },
      fontFamily: {
        "primary-italic": "Poppins-100-italic",
        "primary-300": "Poppins-300",
        "primary-400": "Poppins-400",
        "primary-500": "Poppins-500",
        "primary-600": "Poppins-600",
        "primary-700": "Poppins-700",
        "secondary-italic": "NunitoSans-100-italic",
        "secondary-300": "NunitoSans-300",
        "secondary-400": "NunitoSans-400",
        "secondary-500": "NunitoSans-500",
        "secondary-600": "NunitoSans-600",
        "secondary-700": "NunitoSans-700",
        // "number-regular": "AvenirNext-Regular",
        // "number-bold": "AvenirNext-Bold",
        secondaryIOS: "Arial",
        secondaryAndroid: "sans-serif",
        codeIOS: "Courier",
        codeAndroid: "monospace",
      },
    },
  },
  presets: [require("nativewind/preset")],
  plugins: [],
};
