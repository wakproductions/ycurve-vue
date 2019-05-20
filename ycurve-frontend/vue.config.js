module.exports = {
  configureWebpack: {
    module: {
      rules: [
        {
          test: /\.(txt|md)$/i,
          exclude: /(node_modules|bower_components)/,
          use: 'raw-loader',
        },
      ],
    }
  },
}