Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'application#welcome'

  namespace :api, defaults: { format: :json }, path: '/' do
    resources :forms, except: [:new, :edit]

    post 'f/:token' => 'submissions#create'

    match 'auth/register',     to: 'auth#register',     via: 'post'
    match 'auth/authenticate', to: 'auth#authenticate', via: 'post'
    match 'auth/token_status', to: 'auth#token_status', via: 'get'
  end
end
