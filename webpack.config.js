const path = require('path');

module.exports = {
  entry: './app/javascript/packs/application.js', // Entry point for your JavaScript
  output: {
    path: path.resolve(__dirname, 'public', 'packs'),
    filename: 'bundle.js', // Output file
  },
  mode: 'development',
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader', // If you're using ES6 or React, you'll need Babel
        },
      },
    ],
  },
  resolve: {
    extensions: ['.js'],
  },
  devServer: {
    static: {
      directory: path.join(__dirname, 'public'), // This replaces 'contentBase'
    },
    compress: true,
    port: 3000, // You can change the port if needed
  },
};
