class CreateAccountAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :account_accesses do |t|
      t.references :user
      t.references :account

      t.timestamps
    end
  end
end
