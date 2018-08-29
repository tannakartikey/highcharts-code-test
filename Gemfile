source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Rails Base Gems
ruby '2.3.4'
gem 'rails', '~> 5.1.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'thin'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks'
gem 'bootstrap', '~> 4.0.0.beta'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'

# Application Core
gem 'devise'
gem 'devise_invitable'
gem 'dotenv'
gem 'webpacker'
gem 'carrierwave', '~> 1.0'

# API configurations
# gem 'rack-cors'
gem 'rack-attack'
# gem 'active_model_serializers'

# Secruity
gem 'bundler-audit'
gem 'brakeman'

# Heroku Caching
gem 'rack-cache'

# Logging
gem 'rails_semantic_logger'
gem "sentry-raven"


# Authentication and Authorization
gem 'rolify'
gem 'pundit'
gem 'openid_connect'

# Payments
gem 'braintree'

# Error handling
gem 'exception_handler', '~> 0.8.0.0'

# Validations
gem "validate_url"


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'pry', '~> 0.9'
  gem 'pry-remote'
  gem 'pry-nav'
  gem 'awesome_print'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker', github: 'stympy/faker'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
end

group :production, :staging do
  gem 'rails_12factor'
  gem 'yui-compressor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'httparty'