class AddTokenEndpointAuthMethdodToApps < ActiveRecord::Migration[5.1]
  def change
    add_column :apps, :token_endpoint_auth_method, :string
  end
end
