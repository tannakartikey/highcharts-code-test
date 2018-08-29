module Services
  class OpenIdConnectionService
    def initialize(app)
      @app = app
    end

    # Register OpenID client
    def register      
      HTTParty.post(reg_url, 
        :body => { :client_name => @app.name, 
                   :application_type => @app.platform, 
                   :subject_type => 'public', 
                   :token_endpoint_auth_method => @app.token_endpoint_auth_method,
                   :redirect_uris => return_array(@app.openid_redirect_urls),
                   :logo_uri => @app.logo_uri,
                   :contacts => return_array(@app.contacts),
                   :client_uri => @app.client_uri,
                   :policy_uri => @app.policy_uri,
                   :tos_uri => @app.tos_uri
                 }.to_json,
        :headers => { 'Content-Type' => 'application/json' })         
    end

    # Update OpenID client
    def update  
      HTTParty.put("#{reg_url}/#{@app.openid_client_id}", 
        :body => {
                  :client_name => @app.name,  
                  :application_type => @app.platform,                     
                  :grant_types => [
                    'authorization_code'
                  ],
                  :id_token_signed_response_alg => "RS256",
                  :require_auth_time => false,
                  :response_types => [
                      "code"
                  ],
                  :subject_type => "public",
                  :token_endpoint_auth_method => @app.token_endpoint_auth_method,
                  :post_logout_redirect_uris => [],
                  :backchannel_logout_session_required => false,
                  :frontchannel_logout_session_required => false,           
                  :request_uris => [], 
                  :logo_uri => @app.logo_uri,
                  :contacts => return_array(@app.contacts),
                  :client_uri => @app.client_uri,
                  :policy_uri => @app.policy_uri,
                  :tos_uri => @app.tos_uri,
                  :client_id => @app.openid_client_id,
                  :client_secret => @app.openid_client_secret,
                  :redirect_uris => return_array(@app.openid_redirect_urls),
                  :revocation_endpoint_auth_method => @app.token_endpoint_auth_method
                 }.to_json,
        :headers => { 'Authorization' => auth, 'Content-Type' => 'application/json' } )  
    end

    # Update OpenID client
    def destroy 
      HTTParty.delete("#{reg_url}/#{@app.openid_client_id}", :headers => { "Authorization" => auth })
    end
    
    private    
      def return_array(val)
        redirect_uris = val.each_line.reject { |u| u =~ /^\s+$/ }.map { |u| u.strip.split(',') }
        redirect_uris.flatten!
        redirect_uris.map! { |u| u.strip }
      end

      def reg_url
        ENV['OPENID_ISSUER'] + "/reg"
      end

      def auth
        "Bearer " + @app.openid_client_access_token
      end
  end
end