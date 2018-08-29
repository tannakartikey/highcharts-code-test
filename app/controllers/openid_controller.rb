class OpenidController < ApplicationController

  def openid_auth
    # redirect_to authorization_uri openid_auth_callback_path
    redirect_to client.authorization_uri(
      response_type: :code,
      state: new_nonce,
      nonce: new_nonce,
      scope: config.scopes_supported & [:openid, :email, :profile, :address].collect(&:to_s)
    )
  end

  # Callback method from IDP
  def openid_auth_callback
    client.redirect_uri = openid_auth_callback_url
    client.authorization_code = params['code']
    access_token = client.access_token!(client_auth_method: client_auth_method)
    _id_token_ = decode_id access_token.id_token
    _id_token_.verify!(
      issuer: ENV['OPENID_ISSUER'],
      client_id: ENV['OPENID_CLIENT_ID'],
      nonce: stored_nonce
    )

    @user = User.find_by openid_identifier: _id_token_.subject
    if @user && @user.account
      sign_in @user, scope: :user
      redirect_to users_analytics_url(subdomain: @user.account.subdomain)
    else
      redirect_to new_user_registration_path(
        openid_identifier: _id_token_.subject,
        openid_access_token: access_token.access_token,
        openid_id_token: access_token.id_token
      )
    end
  end

  protected

  def permit_user_params
    params.require(:user).permit(:user, :subdomain, :openid_identifier, :openid_access_token, :openid_id_token)
  end

  def options
    {
      identifier: ENV['OPENID_CLIENT_ID'],
      secret: ENV['OPENID_CLIENT_SECRET'],
      scopes_supported: [:openid, :email, :profile, :address],
      host: ENV['OPENID_HOST'],
      port: ENV['OPENID_PORT'],
      scheme: 'https',
      jwks_uri:openid_config.jwks_uri,
      authorization_endpoint: openid_config.authorization_endpoint,
      token_endpoint: openid_config.token_endpoint,
      userinfo_endpoint: openid_config.userinfo_endpoint,
      redirect_uri: openid_auth_callback_url
    }
  end

  def openid_config
    @openid_config ||= OpenIDConnect::Discovery::Provider::Config.discover! ENV['OPENID_ISSUER']
  end

  def client
    @client ||= OpenIDConnect::Client.new options
  end

  def client_auth_method
    supported = openid_config.token_endpoint_auth_methods_supported
    if supported.present? && !supported.include?('client_secret_basic')
      :post
    else
      :basic
    end
  end

  def decode_id(id_token)
    OpenIDConnect::ResponseObject::IdToken.decode id_token, openid_config.jwks
  end
end
