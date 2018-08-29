require 'rails_helper'

describe Account do
  it { should validate_presence_of(:subdomain) }
  it { should validate_exclusion_of(:subdomain).in_array(%w(www)) }
end
