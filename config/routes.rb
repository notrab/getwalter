Rails.application.routes.draw do
  post 'f/:token' => 'submissions#create'

  get '/thanks' => 'submissions#thanks', as: :thanks
  get '/oops' => 'submissions#oops', as: :oops

  # constraints Clearance::Constraints::SignedIn.new { |user| user.admin? } do
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
  # end

    root to: 'application#angular'

    namespace :api, defaults: { format: :json } do
      resources :forms, except: [:new, :edit]
    end

    match '/auth/register',     to: 'auth#register',     via: 'post'
    match '/auth/authenticate', to: 'auth#authenticate', via: 'post'
    match '/auth/token_status', to: 'auth#token_status', via: 'get'

    # root to: 'marketing#index'

    # get '/sign_up' => 'users#new', as: 'sign_up_app'
    # get '/sign_in' => 'sessions#new', as: 'sign_in_app'
  # end

  # resources :users, controller: 'clearance/users', only: [] do
  #   resource :password,
  #     controller: 'clearance/passwords',
  #     only: [:create, :update]
  # end
  #
  # resources :users, controller: "users" do
  #   resource(
  #     :password,
  #     controller: "passwords",
  #     only: [:create, :update]
  #   )
  # end
end
