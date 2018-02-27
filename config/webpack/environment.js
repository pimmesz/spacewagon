const { environment } = require('@rails/webpacker')

module.exports = environment

// Bootstrap 3 has a dependency over jQuery:
const webpack = require('webpack')
environment.plugins.set('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  })
)
