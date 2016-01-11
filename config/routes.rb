Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  post 'f/:token' => 'submissions#create'

  get '/thanks' => 'submissions#thanks', as: :thanks
  get '/oops' => 'submissions#oops', as: :oops

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'dashboards#show', as: :signed_in_root

    resources :forms
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'marketing#index'
  end
end
