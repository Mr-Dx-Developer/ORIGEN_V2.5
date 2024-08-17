import path from "path";
import JavaScriptObfuscator from 'webpack-obfuscator';

const server = {
  target: 'node',
  entry: "./src/server/server.ts",
  module: {
    rules: [
      {
        test: /\.ts?$/,
        use: ["ts-loader"],
        exclude: /node_modules/,
      },
    ],
  },
  plugins: [
    new JavaScriptObfuscator({
      compact: true,
      debugProtection: false,
      debugProtectionInterval: 4000,
      disableConsoleOutput: true,
      identifierNamesGenerator: 'hexadecimal',
      log: false,
      numbersToExpressions: true,
      renameGlobals: false,
      selfDefending: true,
      simplify: true,
      splitStrings: true,
      splitStringsChunkLength: 5,
      stringArray: true,
      stringArrayCallsTransform: true,
      stringArrayCallsTransformThreshold: 1,
      stringArrayEncoding: ['rc4'],
      stringArrayIndexShift: true,
      stringArrayRotate: true,
      stringArrayShuffle: true,
      stringArrayWrappersCount: 15,
      stringArrayWrappersChainedCalls: true,    
      stringArrayWrappersParametersMaxCount: 15,
      stringArrayWrappersType: 'function',
      stringArrayThreshold: 1,
      transformObjectKeys: true,
      unicodeEscapeSequence: false
    }, [path.resolve("../", "server")])
  ],
  optimization: {
    minimize: true,
  },
  resolve: {
    extensions: [".ts", ".js"],
    preferRelative: true,
  },
  output: {
    filename: "server.js",
    path: path.resolve("../", "server"),
  },
};

const client = {
  entry: "./src/client/client.ts",
  module: {
    rules: [
      {
        test: /\.ts?$/,
        use: ["ts-loader"],
        exclude: /node_modules/,
      },
    ],
  },
  plugins: [
    new JavaScriptObfuscator({
      compact: true,
      debugProtection: false,
      debugProtectionInterval: 4000,
      disableConsoleOutput: true,
      identifierNamesGenerator: 'hexadecimal',
      log: false,
      numbersToExpressions: true,
      renameGlobals: false,
      selfDefending: true,
      simplify: true,
      splitStrings: true,
      splitStringsChunkLength: 5,
      stringArray: true,
      stringArrayCallsTransform: true,
      stringArrayCallsTransformThreshold: 1,
      stringArrayEncoding: ['rc4'],
      stringArrayIndexShift: true,
      stringArrayRotate: true,
      stringArrayShuffle: true,
      stringArrayWrappersCount: 15,
      stringArrayWrappersChainedCalls: true,    
      stringArrayWrappersParametersMaxCount: 15,
      stringArrayWrappersType: 'function',
      stringArrayThreshold: 1,
      transformObjectKeys: true,
      unicodeEscapeSequence: false
    }, [path.resolve("../", "client")])
  ],
  optimization: {
    minimize: true,
  },
  resolve: {
    extensions: [".ts", ".js"],
    preferRelative: true,
  },
  output: {
    filename: "client.js",
    path: path.resolve("../", "client"),
  },
};

export default [server, client];