// module.exports = function(api) {
//   api.cache(true);
//   return {
//     presets: ["babel-preset-expo"],
//     plugins: [
//       "macros",
//       "nativewind/babel",
//       ["module-resolver",
//         {
//           root: ["."],
//           extensions: [".js", ".ts", ".tsx", ".json", ".spec.ts"],
//           alias: {
//             "@components": "./src/components",
//             "@navigators": "./src/navigators",
//             "@services": "./src/services",
//             "@styles": "./src/styles",
//             "@theme": "./src/theme",
//             "@utils": "./src/utils",
//             "@models": "./src/models",
//             "@screens": "./src/screens",
//             "@constants": "./src/constants",
//             "@stores": "./src/stores",
//             "@assets": "./src/assets",
//             "@hooks": "./src/hooks",
//           },
//         },
//       ],
//     ],
//   }
// };

module.exports = {
  presets: ["module:metro-react-native-babel-preset", "nativewind/babel"],
  env: {
    production: {},
  },
  plugins: [
    "macros",
    [
      "module-resolver",
      {
        root: ["."],
        extensions: [".js", ".ts", ".tsx", ".json", ".spec.ts"],
        alias: {
          "@components": "./src/components",
          "@navigators": "./src/navigators",
          "@services": "./src/services",
          "@styles": "./src/styles",
          "@theme": "./src/theme",
          "@utils": "./src/utils",
          "@models": "./src/models",
          "@screens": "./src/screens",
          "@constants": "./src/constants",
          "@stores": "./src/stores",
          "@assets": "./src/assets",
          "@hooks": "./src/hooks",
        },
      },
    ],
    [
      "module:react-native-dotenv",
      {
        moduleName: "react-native-dotenv",
        allowUndefined: true,
        verbose: false,
      },
    ],
  ],
};
