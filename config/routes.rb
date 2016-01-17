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

    namespace :api, defaults: { format: :json } do
      resources :forms, except: [:new, :edit]
      resources :users, except: [:new, :edit] do
        get :me
      end
    end
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'marketing#index'

    get '/sign_up' => 'users#new', as: 'sign_up_app'
    get '/sign_in' => 'sessions#new', as: 'sign_in_app'
  end

  resources :users, controller: 'clearance/users', only: [] do
    resource :password,
      controller: 'clearance/passwords',
      only: [:create, :update]
  end

  resources :users, controller: "users" do
    resource(
      :password,
      controller: "passwords",
      only: [:create, :update]
    )
  end
end
