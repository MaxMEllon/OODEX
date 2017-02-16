const webpack = require('webpack');
const path = require('path');
const LiveReloadPlugin = require('webpack-livereload-plugin');

const devBuild = process.env.NODE_ENV !== 'production';
const nodeEnv = devBuild ? 'development' : 'production';

const config = {
  entry: devBuild ? [
    'es5-shim/es5-shim',
    'es5-shim/es5-sham',
    'webpack/hot/only-dev-server',
    'react-hot-loader/patch',
    'webpack-hot-middleware/client?path=http://localhost:3000/__webpack_hmr',
    'babel-polyfill',
    './app/index.js',
  ] : [
    'es5-shim/es5-shim',
    'es5-shim/es5-sham',
    'babel-polyfill',
    './app/index.js',
  ],

  output: {
    filename: 'webpack-bundle.js',
    path: '/../public',
    publicPath: 'http://localhost:3000/'
  },

  resolve: {
    extensions: ['', '.js', '.jsx'],
    alias: {
      react: path.resolve('./node_modules/react'),
      'react-dom': path.resolve('./node_modules/react-dom'),
    },
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify(nodeEnv),
      },
    }),
  ],
  module: {
    loaders: [
      {
        test: require.resolve('react'),
        loader: 'imports?shim=es5-shim/es5-shim&sham=es5-shim/es5-sham',
      },
      {
        test: /\.jsx?$/,
        loaders: devBuild ? ['babel-loader'] : ['babel-loader'],
        exclude: /node_modules/,
      },
    ],
  },
};

const prodctionPlugins = [
  new webpack.optimize.DedupePlugin(),
];

if (devBuild) {
  // dev
  config.devtool = 'eval-source-map';
  config.plugins.push(new webpack.HotModuleReplacementPlugin());
  config.plugins.push(new LiveReloadPlugin({
    appendScriptTag: true,
    ignore: null,
  }));
} else {
  // prod
  prodctionPlugins.forEach(plugin => config.plugins.push(plugin));
  console.log('Webpack production build for Rails');
}

module.exports = config;

