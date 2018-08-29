require 'rails_helper'

describe Accounts::SessionsController do
  let(:user) { create(:user) }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe '#new' do
    it 'should get into sign in page' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe '#create' do
    it 'should login valid user' do
      post :create, params: {
        user: {
          email: user.email,
          password: user.password,
        }
      }

      expect(response).to redirect_to(users_dashboard_url(subdomain: user.account.subdomain))
    end

    it 'should not login with wrong password' do
      post :create, params: {
        user: {
          email: user.email,
          password: 'wrong_password',
        }
      }

      expect(response).to have_http_status(:ok)
    end

    it 'should not login with wrong email' do
      post :create, params: {
        user: {
          email: 'wrong@example.com',
          password: user.password,
        }
      }

      expect(response).to have_http_status(:ok)
    end
  end

  describe '#destroy' do
    it 'should sign out and go to root page' do
      sign_in(user, scope: :user)
      delete :destroy

      expect(response).to redirect_to(root_url(subdomain: 'www'))
    end
  end
end
