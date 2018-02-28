const { environment } = require('@rails/webpacker')

module.exports = environment


// In the config/webpack/environment.js
const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.set('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  })
)
module.exports = environment
