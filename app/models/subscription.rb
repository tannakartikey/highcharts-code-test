class Subscription < ApplicationRecord
	belongs_to :user

	validates :user_id, uniqueness: true
	validates :plan_id, presence: true
	validates :customer_id, presence: true
	validates :subscription_id, presence: true
end
