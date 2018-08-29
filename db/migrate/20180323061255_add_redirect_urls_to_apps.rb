class AddRedirectUrlsToApps < ActiveRecord::Migration[5.1]
  def change
    add_column :apps, :openid_redirect_urls, :string
  end
end
