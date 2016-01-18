class ApplicationController < ActionController::Base
  require 'auth_token'

  protect_from_forgery with: :null_session
  before_action :authenticate, except: [:welcome]

  def welcome
    render json: {
      message: "Hi. I'm Walter. Your personal form assistant."
    }
  end

  private

  def authenticate
    begin
      token = request.headers['Authorization'].split(' ').last
      payload, header = AuthToken.valid?(token)
      @current_user = User.find_by(id: payload['user_id'])
    rescue
      render json: { error: 'Authorization header not valid'}, status: :unauthorized
    end
  end
end
