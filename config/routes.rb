Rails.application.routes.draw do
  post 'f/:token' => 'submissions#create'
end
