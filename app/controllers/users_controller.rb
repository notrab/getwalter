class UsersController < ApplicationController
  require 'auth_token'

  skip_before_action :authenticate

  def create
    user = User.new(safe_params)

    if user.save
      token = AuthToken.issue_token({user_id: user.id})
      render json: {user: user, token: token}
    else
      render json: {errors: user.errors}
    end
  end

  def token_status
    token = params[:token]

    if AuthToken.valid? token
      head 200
    else
      head 401
    end
  end

  private

  def safe_params
    params.permit(:name, :email, :password)
  end
end
