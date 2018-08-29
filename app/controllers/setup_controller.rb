class SetupController < ApplicationController
  before_action :authenticate_user!
  before_action :set_app, only: [:show, :edit, :update, :destroy]
  layout 'user'


  def how_it_works
  end
  
  def mobileapps
	  
  end
  
  def get_started
    
  end

  def pricing   
  end

  def sample_apps
  end
  
  

end
