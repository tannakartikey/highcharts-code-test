class ApplicationController < ActionController::Base
  include Pundit
  include Nonce

  protect_from_forgery prepend: true

  

  

  private



  
end
