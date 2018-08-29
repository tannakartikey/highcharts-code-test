class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  skip_before_action :verify_authenticity_token


  def new
    @openid_identifier = params[:openid_identifier]
    @openid_access_token = params[:openid_access_token]
    @openid_id_token = params[:openid_id_token]

    super
  end

  def edit
    render layout: 'user'
  end


  def create
    build_resource(sign_up_params)
    
      invited_record = User.where(:email => params[:user][:email]).first

      if invited_record.present? &&
        invited_record.invitation_sent_at.present? &&
        invited_record.invitation_accepted_at.blank?

        invited_record.destroy
      end

      if resource.openid_identifier.present?
        resource.password = SecureRandom.hex(5)
        resource.password_confirmation = resource.password
      end

      if resource.valid?
        # resource.skip_confirmation! if resource.openid_identifier.present?
        resource.save

        if resource.persisted?
          # Set user role
          resource.add_role :user

          if resource.active_for_authentication?
            set_flash_message! :notice, :signed_up
            sign_up(resource_name, resource)
            respond_with resource, location: after_sign_up_path_for(resource)
          else
            set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
            expire_data_after_sign_in!
            respond_with resource, location: after_inactive_sign_up_path_for(resource)
          end
        else
          render_with_error resource
        end
      else
        render_with_error resource
      end
  end


  protected

  def render_with_error(resource)
    clean_up_passwords resource
    set_minimum_password_length
    respond_with resource
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:openid_identifier, :openid_access_token, :openid_id_token])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    get_started_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
