# frozen_string_literal: true
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379' }
end
