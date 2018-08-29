require 'rails_helper'

describe Subscription do
	it { should validate_uniqueness_of(:user_id) }
  it { should validate_presence_of(:plan_id) }
  it { should validate_presence_of(:customer_id) }
  it { should validate_presence_of(:subscription_id) }
end
