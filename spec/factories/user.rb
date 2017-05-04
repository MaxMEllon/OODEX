# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password '12345678'

    trait :admin do
      is_admin { true }
    end

    factory :admin, traits: [:admin]
  end
end
