Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  constraints defaults: {format: :json} do
    root to: 'application#welcome'

    post '/f/:token' => 'submissions#create'

    resources :sessions, only: [:create]

    resources :users, only: [:create]
    get '/users/token_status', to: 'users#token_status'

    resources :forms, except: [:new, :edit]
  end
end
