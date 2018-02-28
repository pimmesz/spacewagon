const { environment } = require('@rails/webpacker')

// In the config/webpack/environment.js

const webpack = require('webpack')
environment.plugins.set('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  })
)

module.exports = environment
