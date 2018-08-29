require 'rails_helper'

describe App do
  it { should validate_presence_of(:domain) }
  it { should validate_presence_of(:openid_redirect_urls) }
  it { should validate_uniqueness_of(:domain) }

  context 'before_save' do
    it 'should populate name with doamin and platform' do
      app = FactoryBot.create(:app)
      expect(app.reload.name).to eql("#{app.domain}-#{app.platform}-#{app.id.to_s.rjust(5, '0')}")
    end
  end
end
