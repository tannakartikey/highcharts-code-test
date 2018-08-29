class ManageController < ApplicationController
  before_action :authenticate_user!
  layout 'user'

  def index
    @users = User.all.order(created_at: :asc)
  end
end
