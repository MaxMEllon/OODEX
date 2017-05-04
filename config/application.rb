# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

Dotenv::Railtie.load if Rails.env != 'production'

class TEE::Application < Rails::Application
  config.time_zone = 'Tokyo'
  config.active_record.default_timezone = :local
  config.active_record.time_zone_aware_types = %i[datetime time]
  config.sass.preferred_syntax = :sass
  config.sass.cache = true
  config.i18n.default_locale = :ja

  config.generators do |g|
    g.helper false
    g.assets false
  end
end
