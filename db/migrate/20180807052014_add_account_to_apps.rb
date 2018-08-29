class AddAccountToApps < ActiveRecord::Migration[5.1]
  def change
    add_column :apps, :account_id, :integer
  end
end