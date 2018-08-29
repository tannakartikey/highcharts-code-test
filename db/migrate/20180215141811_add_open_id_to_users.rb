class AddOpenIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :openid_identifier, :string
    add_column :users, :openid_access_token, :string
    add_column :users, :openid_id_token, :string
  end
end
