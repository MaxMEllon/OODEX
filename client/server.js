const path = require('path');
const webpack = require('webpack');
const express = require('express');
const config = require('./webpack.config.babel');
const devMiddleware = require('webpack-dev-middleware');
const hotMiddleware = require('webpack-hot-middleware');

const app = express();
const compiler = webpack(config);

app.use(devMiddleware(compiler, {
  noInfo: true,
  hot: true,
  inline: true,
  contentBase: './',
  watchOptions: { poll: true },
  historyApiFallback: true,
  stats: { colors: true },
}));

app.use(hotMiddleware(compiler, {
  log: console.info,
}));

app.listen(3000, '0.0.0.0', (err) => {
  if (err) {
    return console.error(err);
  }
  console.info('Listening at http://localhost:3000');
});
