Rails.application.routes.draw do
  root to: 'home#index'
  get 'about_us' => 'home#about_us', as: 'about_us'
  get 'consumers' => 'home#consumers', as: 'consumers'
  get 'enterprises' => 'home#enterprises', as: 'enterprises'
  get 'beta_invite' => 'home#beta_invite', as: 'beta_invite'
  get 'privacy_policy' => 'home#privacy_policy', as: 'privacy_policy'
  get 'terms_of_service' => 'home#terms_of_service', as: 'terms_of_service'
  resources :contacts, only: %i[new create update]
  get 'contacts/thank_you' => 'contacts#thank_you', as: :thank_you

  devise_for :users,
             :controllers => {
                  registrations: 'users/registrations',
                  sessions:      'users/sessions',
                  invitations:   'users/invitations'
             }
  get '/openid_auth', to: 'openid#openid_auth', as: 'openid_auth'
  get '/openid_auth_callback', to: 'openid#openid_auth_callback', as: 'openid_auth_callback'
  post '/openid_register', to: 'openid#openid_register', as: 'openid_register'


  get '/welcome', to: 'welcome#index', as: 'welcome'
  get '/mobile-apps', to: 'setup#mobile_apps', as: 'mobile-apps'
  get '/sample-apps', to: 'setup#sample_apps', as: 'sample-apps'
  get '/get-started', to: 'setup#get_started', as: 'get-started'
  get '/pricing', to: 'setup#pricing', as: 'pricing'
  get '/analytics', to: 'analytics#index', as: 'analytics'
  get '/logs', to: 'analytics#logs', as: 'logs'
  get '/manage', to: 'manage#index', as: 'manage'

  resources :accounts
  # resources :users
  resources :apps
  resources :subscriptions


end
