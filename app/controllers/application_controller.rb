class ApplicationController < ActionController::Base
  require 'auth_token'

  protect_from_forgery with: :null_session
  before_action :authenticate!

  def welcome
    render json: {
      message: "Hi #{@current_user.name}. I'm Walter. Your personal form assistant."
    }
  end

  protected

  def json_request?
    request.format.json?
  end

  private

  def authenticate!
    begin
      @current_user = User.find_by(id: payload_user_id)
    rescue ActiveRecord::RecordNotFound
      render json: {error: 'User not found.'},
        status: :unauthorized
    rescue
      render json: {error: 'Authorization header not valid'},
        status: :unauthorized
    end
  end

  def payload_user_id
    AuthToken.valid?(bearer_token)['user_id']
  end

  def bearer_token
    header = request.headers['Authorization']
    header ? auth_header.split(' ').last : nil
  end
end
