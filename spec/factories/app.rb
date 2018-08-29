require 'faker'

FactoryBot.define do
  factory :app do
    domain			{ Faker::String }
    platform		{ Faker::String }
    openid_redirect_urls { Faker::String }
  end
end
