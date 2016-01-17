class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def angular
    render 'layouts/application'
  end
end
