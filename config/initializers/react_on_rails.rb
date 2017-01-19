# frozen_string_literal: true
ReactOnRails.configure do |config|
  config.generated_assets_dir = File.join(%w(app assets webpack))
  config.webpack_generated_files = %w(webpack-bundle.js)
  config.server_bundle_js_file = 'webpack-bundle.js'
  config.npm_build_test_command = 'npm run build:test'
  config.npm_build_production_command = 'npm run build:production'
  config.prerender = false
  config.trace = Rails.env.development?
  config.development_mode = Rails.env.development?
  config.replay_console = true
  config.logging_on_server = true
  config.raise_on_prerender_error = false
  config.server_renderer_pool_size = 1 # increase if you're on JRuby
  config.server_renderer_timeout = 20 # seconds
  config.i18n_dir = Rails.root.join('client', 'app', 'libs', 'i18n')
  config.skip_display_none = false
  config.server_render_method = 'NodeJS'
  config.symlink_non_digested_assets_regex =
    /\.(png|jpg|jpeg|gif|tiff|woff|ttf|eot|svg|map)/
end
