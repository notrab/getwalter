Rails.application.routes.draw do
  post 'f/:token' => 'submissions#create'

  get '/thanks' => 'submissions#thanks', as: :thanks
  get '/oops' => 'submissions#oops', as: :oops

  constraints Clearance::Constraints::SignedIn.new { |user| user.admin? } do
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'application#angular', as: :signed_in_root

    get '/me' => 'users#me'

    namespace :api, defaults: {format: :json} do
      resources :forms
      resources :users
    end

    get '/my_account' => 'users#edit', as: 'my_account'
    patch '/my_account' => 'users#update', as: 'edit_my_account'
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'marketing#index'

    get '/sign_up' => 'users#new', as: 'sign_up_app'
    get '/sign_in' => 'sessions#new', as: 'sign_in_app'
  end

  resources :users, controller: 'clearance/users', only: [] do
    resource :password,
      controller: 'clearance/passwords',
      only: [:create, :edit, :update]
  end

  resources :users, controller: "users" do
    resource(
      :password,
      controller: "passwords",
      only: [:create, :edit, :update]
    )
  end
end
