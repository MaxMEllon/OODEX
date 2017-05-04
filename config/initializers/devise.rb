# frozen_string_literal: true
Devise.setup do |config|
  config.mailer_sender = 'tee@stu.kagawa-u.ac.jp'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.scoped_views = true

  config.secret_key = 'a6006e784ceb7dcaca4cc5235cab5f1c9b938437d5936cf0d0e8db9ce0fa9200cea43787c30745bf0f47509d800d74a1a6a125292bde9f952e1518e8c1b477a8'
end
