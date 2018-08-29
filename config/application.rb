require_relative 'boot'

require 'rails/all'
require 'dotenv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv.load

module Deauthorized
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.serve_static_assets = true

    config.middleware.use Rack::Attack

    # Config for sentry bug trakcing on heroku
    Raven.configure do |config|
      config.dsn = 'https://6818caa1d8234a9a8490c5dde508ef45:d3c37f736c314d88afb8a28e9a72e69f@sentry.io/1255734'
      config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
    end
    config.filter_parameters << :password

    
    # CORS
    # config.middleware.use Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '*',
    #       :headers => :any,
    #       :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
    #       :methods => [:get, :post, :options, :delete, :put]
    #   end
    # end

    config.enable_dependency_loading = true

    config.exception_handler = {
      dev:        true, 

      exceptions: {
        404 => { layout: "exception"},
        500 => { layout: "exception"},
        501 => { layout: "exception"},
        502 => { layout: "exception"},
        503 => { layout: "exception"},
        504 => { layout: "exception"},
        505 => { layout: "exception"},
        507 => { layout: "exception"},
        510 => { layout: "exception"}

      }
    }

    config.autoload_paths << Rails.root.join('lib')
    
  end
end
