require 'rails_helper'
require 'faker'

describe Accounts::InvitationsController do 
  let(:user) { create(:user) }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'GET #new' do
    context 'with signed in user' do
      it 'should get into new invitation page' do
        sign_in(user, scope: :user)

        get :new
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:new)
      end
    end
    
    context 'with unsigned in user' do
      it 'should redirect to sign in page' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    before(:each) do
      sign_in(user, scope: :user)
    end

    it 'should create invitation record' do
      expect {
        post :create, params: {
          user: {email: Faker::Internet.email}
        }
      }.to change{ User.count }.by(1)
    end

    it 'should invitation email' do
      expect {
        post :create, params: {
          user: {email: Faker::Internet.email}
        }
      }.to change{ ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  describe 'GET #edit' do
    it 'should not render accept page with wrong token' do
      get :edit, params: {token: Faker::String.random}
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'PUT #update' do
    let(:user1) { User.invite!({:email => "new_user@example.com"}, user) }
    it 'should confirm user with password' do
      put :update, params: {
        user: {
          password: 'password',
          invitation_token: user1.raw_invitation_token
        }
      }

      user1.reload
      expect(user1.account.subdomain).to eql(user.account.subdomain)
    end
  end
end