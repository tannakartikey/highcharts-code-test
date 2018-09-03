# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create('email'=>'reza.piri@gennovacap.com', 'password'=>'matrix007')
User.create('email'=>'rezapiri@gmail.com', 'password'=>'matrix007')
User.create('email'=>'brendan@parietal.io', 'password'=>'password')
User.create('email'=>'brady.d.cooper@gmail.com', 'password'=>'password')
User.create('email'=>'dave.atherton@qryp.to', 'password'=>'password')
User.create('email'=>'andrey.saleba@gmail.com', 'password'=>'password')


App.create('name'=>'Gennovacap', 'platform'=>'web', 'account_id'=>'', 'user_id'=>'1', 'openid_client_id'=>'2393bf30-75c5-42ce-8de4-5289fa87bcd3', 'openid_client_secret'=>'lsm2DC4NoKS1qBMX2s4KzYq9wlACG0rEDS5+b36g3oRvXdiFtOKgnvv2OlYezanP', 'openid_redirect_urls'=>'http://gennovacap.com/callback_url', 'openid_client_access_token'=>'', 'token_endpoint_auth_method'=>'client_secret_basic', 'logo_uri'=>'http://gennovacap.com/logo.png', 'client_uri'=>'http://gennovacap.com/', 'policy_uri'=>'http://gennovacap.com/policy', 'tos_uri'=>'http://gennovacap.com/tos', 'contacts'=>'reza@gennovacap.com')
App.create('name'=>'Acme', 'platform'=>'web', 'account_id'=>'', 'user_id'=>'1', 'openid_client_id'=>'2393bf30-75c5-42ce-8de4-5289fa87bcd3', 'openid_client_secret'=>'lsm2DC4NoKS1qBMX2s4KzYq9wlACG0rEDS5+b36g3oRvXdiFtOKgnvv2OlYezanP', 'openid_redirect_urls'=>'http://Acme.com/callback_url', 'openid_client_access_token'=>'', 'token_endpoint_auth_method'=>'client_secret_basic', 'logo_uri'=>'http://Acme.com/logo.png', 'client_uri'=>'http://Acme.com/', 'policy_uri'=>'http://Acme.com/policy', 'tos_uri'=>'http://Acme.com/tos', 'contacts'=>'reza@Acme.com')

App.create('name'=>'Gennovacap', 'platform'=>'web', 'account_id'=>'', 'user_id'=>'2', 'openid_client_id'=>'2393bf30-75c5-42ce-8de4-5289fa87bcd3', 'openid_client_secret'=>'lsm2DC4NoKS1qBMX2s4KzYq9wlACG0rEDS5+b36g3oRvXdiFtOKgnvv2OlYezanP', 'openid_redirect_urls'=>'http://gennovacap.com/callback_url', 'openid_client_access_token'=>'', 'token_endpoint_auth_method'=>'client_secret_basic', 'logo_uri'=>'http://gennovacap.com/logo.png', 'client_uri'=>'http://gennovacap.com/', 'policy_uri'=>'http://gennovacap.com/policy', 'tos_uri'=>'http://gennovacap.com/tos', 'contacts'=>'reza@gennovacap.com')
App.create('name'=>'Acme', 'platform'=>'web', 'account_id'=>'', 'user_id'=>'2', 'openid_client_id'=>'2393bf30-75c5-42ce-8de4-5289fa87bcd3', 'openid_client_secret'=>'lsm2DC4NoKS1qBMX2s4KzYq9wlACG0rEDS5+b36g3oRvXdiFtOKgnvv2OlYezanP', 'openid_redirect_urls'=>'http://Acme.com/callback_url', 'openid_client_access_token'=>'', 'token_endpoint_auth_method'=>'client_secret_basic', 'logo_uri'=>'http://Acme.com/logo.png', 'client_uri'=>'http://Acme.com/', 'policy_uri'=>'http://Acme.com/policy', 'tos_uri'=>'http://Acme.com/tos', 'contacts'=>'reza@Acme.com')

App.create('name'=>'Gennovacap', 'platform'=>'web', 'account_id'=>'', 'user_id'=>'3', 'openid_client_id'=>'2393bf30-75c5-42ce-8de4-5289fa87bcd3', 'openid_client_secret'=>'lsm2DC4NoKS1qBMX2s4KzYq9wlACG0rEDS5+b36g3oRvXdiFtOKgnvv2OlYezanP', 'openid_redirect_urls'=>'http://gennovacap.com/callback_url', 'openid_client_access_token'=>'', 'token_endpoint_auth_method'=>'client_secret_basic', 'logo_uri'=>'http://gennovacap.com/logo.png', 'client_uri'=>'http://gennovacap.com/', 'policy_uri'=>'http://gennovacap.com/policy', 'tos_uri'=>'http://gennovacap.com/tos', 'contacts'=>'reza@gennovacap.com')
App.create('name'=>'Acme', 'platform'=>'web', 'account_id'=>'', 'user_id'=>'3', 'openid_client_id'=>'2393bf30-75c5-42ce-8de4-5289fa87bcd3', 'openid_client_secret'=>'lsm2DC4NoKS1qBMX2s4KzYq9wlACG0rEDS5+b36g3oRvXdiFtOKgnvv2OlYezanP', 'openid_redirect_urls'=>'http://Acme.com/callback_url', 'openid_client_access_token'=>'', 'token_endpoint_auth_method'=>'client_secret_basic', 'logo_uri'=>'http://Acme.com/logo.png', 'client_uri'=>'http://Acme.com/', 'policy_uri'=>'http://Acme.com/policy', 'tos_uri'=>'http://Acme.com/tos', 'contacts'=>'reza@Acme.com')

App.create('name'=>'Gennovacap', 'platform'=>'web', 'account_id'=>'', 'user_id'=>'4', 'openid_client_id'=>'2393bf30-75c5-42ce-8de4-5289fa87bcd3', 'openid_client_secret'=>'lsm2DC4NoKS1qBMX2s4KzYq9wlACG0rEDS5+b36g3oRvXdiFtOKgnvv2OlYezanP', 'openid_redirect_urls'=>'http://gennovacap.com/callback_url', 'openid_client_access_token'=>'', 'token_endpoint_auth_method'=>'client_secret_basic', 'logo_uri'=>'http://gennovacap.com/logo.png', 'client_uri'=>'http://gennovacap.com/', 'policy_uri'=>'http://gennovacap.com/policy', 'tos_uri'=>'http://gennovacap.com/tos', 'contacts'=>'reza@gennovacap.com')
App.create('name'=>'Acme', 'platform'=>'web', 'account_id'=>'', 'user_id'=>'4', 'openid_client_id'=>'2393bf30-75c5-42ce-8de4-5289fa87bcd3', 'openid_client_secret'=>'lsm2DC4NoKS1qBMX2s4KzYq9wlACG0rEDS5+b36g3oRvXdiFtOKgnvv2OlYezanP', 'openid_redirect_urls'=>'http://Acme.com/callback_url', 'openid_client_access_token'=>'', 'token_endpoint_auth_method'=>'client_secret_basic', 'logo_uri'=>'http://Acme.com/logo.png', 'client_uri'=>'http://Acme.com/', 'policy_uri'=>'http://Acme.com/policy', 'tos_uri'=>'http://Acme.com/tos', 'contacts'=>'reza@Acme.com')

20.times do |i|
  begin
    Stat.create!(
      period_starting: i.days.ago,
      distinct_identities: rand(1..1000),
      app: App.first
    )
    print '.'
  rescue => e
    puts e.message
  end
end
