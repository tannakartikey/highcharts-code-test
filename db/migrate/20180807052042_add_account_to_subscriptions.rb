class AddAccountToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :account_id, :integer
  end
end