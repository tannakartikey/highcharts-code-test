require 'rails_helper'

describe Accounts::RegistrationsController do
  let(:user) { create(:user) }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe '#new' do
    it 'should get new sign up page' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe '#create' do
    let(:user1) { build(:user) }
    let(:user2) { build(:user) }

    it 'should validate email' do
      post :create, params: {
        user: {
          email: user.email,
          password: 'password',
          subdomain: Faker::Internet.domain_suffix
        }
      }

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:new)
    end

    it 'should validate password length' do
      post :create, params: {
        user: {
          email: user1.email,
          password: 'pass',
          subdomain: user1.subdomain
        }
      }

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:new)
    end

    it 'should not create user with reserved subdomain' do
      expect {
        post :create, params: {
          user: {
            email: user2.email,
            password: user2.password,
            subdomain: 'www'
          }
        }
      }.to change{User.count}.by(0)
    end

    it 'should create user' do
      expect {
        post :create, params: {
          user: {
            email: user1.email,
            password: 'password',
            subdomain: user1.subdomain
          }
        }
      }.to change{User.count}.by(1)

      expect(response).to redirect_to(users_dashboard_url(subdomain: user1.subdomain))
    end

    it 'should create new account' do
      expect {
        post :create, params: {
          user: {
            email: user1.email,
            password: 'password',
            subdomain: user1.subdomain
          }
        }
      }.to change{Account.count}.by(1)        
    end
  end
end
