# frozen_string_literal: true

workers 3
threads 8, 32

application_path = File.expand_path('../..', __FILE__)

environment ENV.fetch('RAILS_ENV') { 'development' }

preload_app!

bind "unix:///tmp/sockets/puma.sock"

before_fork do
  Dotenv.overload
end

plugin :tmp_restart
