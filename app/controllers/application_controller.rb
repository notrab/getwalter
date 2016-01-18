class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def welcome
    render json: {
      message: "Hi. I'm Walter. Your personal form assistant."
    }
  end
end
