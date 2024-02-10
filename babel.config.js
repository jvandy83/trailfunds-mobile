// module.exports = {
//   presets: ["babel-preset-expo", "module:metro-react-native-babel-preset"],
//   plugins: [
//     "react-native-reanimated/plugin",
//     "macros",
//     "module:react-native-dotenv",
//     "nativewind/babel",
//     "module-resolver",
//   ],
// };

module.exports = {
  presets: ["module:metro-react-native-babel-preset"],
  env: {
    production: {},
  },
  plugins: [
    "macros",
    "nativewind/babel",
    [
      "@babel/plugin-proposal-decorators",
      {
        legacy: true,
      },
    ],
    ["@babel/plugin-proposal-optional-catch-binding"],
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
    ["@babel/plugin-transform-export-namespace-from"],
    ["react-native-reanimated/plugin"],
    [
      "module:react-native-dotenv",
      {
        moduleName: "react-native-dotenv",
        allowUndefined: true,
        verbose: false,
      },
    ],
  ],
  overrides: [
    {
      test: (fileName) => !fileName.includes("node_modules"),
      plugins: [
        [require("@babel/plugin-proposal-class-properties"), { loose: false }],
      ],
    },
  ],
};
