require 'faker'

FactoryBot.define do
  factory :account do
    subdomain { Faker::Internet.domain_suffix }
  end

  factory :user do
    email                   { Faker::Internet.email }
    password                "password"
    password_confirmation   "password"
    account
  end
end
