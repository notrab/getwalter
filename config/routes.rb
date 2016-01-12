Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  post 'f/:token' => 'submissions#create'

  get '/thanks' => 'submissions#thanks', as: :thanks
  get '/oops' => 'submissions#oops', as: :oops

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'application#angular', as: :signed_in_root

    namespace :api, defaults: {format: :json} do
      resources :forms
    end
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'marketing#index'
  end

  resources :users, controller: 'clearance/users', only: [] do
    resource :password,
      controller: 'clearance/passwords',
      only: [:create, :edit, :update]
  end

  # get '/sign_up' => 'users#new', as: 'sign_up_app'
  get '/sign_in' => 'sessions#new', as: 'sign_in_app'

  get '/my_account' => 'users#edit', as: 'my_account'
  patch '/my_account' => 'users#update', as: 'edit_my_account'

  resources :users, controller: "users" do
    resources :notes, only: [:create, :edit, :update]
    resource(
      :password,
      controller: "passwords",
      only: [:create, :edit, :update]
    )
  end
end
