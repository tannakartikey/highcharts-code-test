class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_column :users, :account_id, :integer
  end
end
