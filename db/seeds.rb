# frozen_string_literal: true

User.create(
  email: 'TEE@stu.eng.kagawa-u.ac.jp',
  password: 'hogehoge',
  password_confirmation: 'hogehoge',
  is_admin: true
)

User.create(
  email: 's00t000@stu.eng.kagawa-u.ac.jp',
  password: 'hogehoge',
  password_confirmation: 'hogehoge',
  is_admin: false
)
