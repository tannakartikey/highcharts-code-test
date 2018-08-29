class WelcomeController < ApplicationController
  before_action :authenticate_user!
  layout 'welcome'

  def index

  end
  
  

end
