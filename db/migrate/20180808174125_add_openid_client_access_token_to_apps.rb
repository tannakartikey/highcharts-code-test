class AddOpenidClientAccessTokenToApps < ActiveRecord::Migration[5.1]
  def change
    add_column :apps, :openid_client_access_token, :string
  end
end
