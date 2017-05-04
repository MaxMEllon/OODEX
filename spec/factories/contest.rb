# frozen_string_literal: true

FactoryGirl.define do
  factory :contest do
    start_at DateTime.now.iso8601
    end_at DateTime.now.iso8601
    title FFaker::Name.name
  end
end
