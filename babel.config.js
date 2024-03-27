module.exports = function (api) {
  api.cache(true);
  const env = process.env.NODE_ENV || "development";
  const dotenvPath = `.env.${env}`;
  const plugins = [
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
    // Specify custom path for dotenv
    ["module:react-native-dotenv", { path: dotenvPath }],
  ];

  // Only include React Refresh plugin in development environment
  if (env === "development") {
    plugins.push("react-refresh/babel");
  }

  return {
    presets: [
      ["babel-preset-expo", { jsxImportSource: "nativewind" }],
      "nativewind/babel",
    ],
    plugins,
  };
};
