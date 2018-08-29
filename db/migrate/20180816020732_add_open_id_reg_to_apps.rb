class AddOpenIdRegToApps < ActiveRecord::Migration[5.1]
  def change
    add_column :apps, :logo_uri, :string
    add_column :apps, :client_uri, :string
    add_column :apps, :policy_uri, :string
    add_column :apps, :tos_uri, :string
    add_column :apps, :contacts, :string
  end
end
