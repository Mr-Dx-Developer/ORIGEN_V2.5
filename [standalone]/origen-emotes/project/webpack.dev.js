import path from "path";
import { CleanWebpackPlugin } from "clean-webpack-plugin";

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
    new CleanWebpackPlugin({
      protectWebpackAssets: false,
      cleanAfterEveryBuildPatterns: ['*.LICENSE.txt'],
    }),
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
    new CleanWebpackPlugin({
      protectWebpackAssets: false,
      cleanAfterEveryBuildPatterns: ['*.LICENSE.txt'],
    }),
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