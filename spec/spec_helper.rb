# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'rspec/retry'
require 'rubocop'
require 'simplecov'

SimpleCov.start

Dir[Rails.root.join('spec', 'support', '*', '*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.use_instantiated_fixtures = false
  config.mock_with :rspec

  config.verbose_retry = true
  config.display_try_failure_messages = true

  config.include Devise::Test::ControllerHelpers, type: :controller

  [:controller, :view, :request].each do |type|
    config.include ::Rails::Controller::Testing::TestProcess, type: type
    config.include ::Rails::Controller::Testing::TemplateAssertions, type: type
    config.include ::Rails::Controller::Testing::Integration, type: type
  end
  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!

  config.before(:suite) do
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.example_status_persistence_file_path = 'examples.txt'
end
