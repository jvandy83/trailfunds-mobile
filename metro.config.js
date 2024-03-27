// Learn more https://docs.expo.io/guides/customizing-metro

const { withNativeWind } = require("nativewind/metro");

const { getDefaultConfig } = require("expo/metro-config");

const {
  createSentryMetroSerializer,
} = require("@sentry/react-native/dist/js/tools/sentryMetroSerializer");

module.exports = (async () => {
  const config = getDefaultConfig(__dirname);

  const { transformer, resolver, serializer } = config;

  config.transformer = {
    ...transformer,
    babelTransformerPath: require.resolve("react-native-svg-transformer"),
  };

  config.resolver = {
    ...resolver,
    assetExts: resolver.assetExts.filter((ext) => ext !== "svg"),
    sourceExts: [...resolver.sourceExts, "svg"],
  };

  config.serializer = {
    ...serializer,
    customSerializer: createSentryMetroSerializer(),
  };

  const withNativeWindConfig = withNativeWind(config, {
    input: "./global.css",
  });

  return withNativeWindConfig;
})();
