class AddUserIdFieldToApps < ActiveRecord::Migration[5.1]
  def change
  	add_column :apps, :user_id, :integer
  end
end
