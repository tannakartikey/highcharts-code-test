class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :authenticate_user!, :only => [:destroy]
  # skip_before_action :verify_authenticity_token

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  def after_sign_in_path_for(resource)

    analytics_path
    
    if resource.sign_in_count == 1
        get_started_path
    else
        analytics_path
    end

  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:openid_url])
  # end
end
