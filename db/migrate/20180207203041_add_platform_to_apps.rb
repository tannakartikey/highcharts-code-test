class AddPlatformToApps < ActiveRecord::Migration[5.1]
  def change
    add_column :apps, :platform, :string
  end
end
