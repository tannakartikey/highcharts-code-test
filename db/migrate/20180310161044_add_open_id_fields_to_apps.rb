class AddOpenIdFieldsToApps < ActiveRecord::Migration[5.1]
  def change
    add_column :apps, :openid_client_id, :string
    add_column :apps, :openid_client_secret, :string
  end
end
