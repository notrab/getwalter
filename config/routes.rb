Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'application#welcome'

  post '/auth/register' => 'api/auth#register'
  post '/auth/authenticate' => 'api/auth#authenticate'
  get '/auth/token_status' => 'api/auth#token_status'

  namespace :api, defaults: { format: :json }, path: '/' do
    resources :forms, except: [:new, :edit]

    post 'f/:token' => 'submissions#create'
  end
end
