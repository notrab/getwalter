class SessionsController < ApplicationController
  require 'auth_token'

  skip_before_action :authenticate

  def create
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      token = AuthToken.issue_token({user_id: user.id})
      render json: {user: user, token: token}
    else
      render json: {error: "Invalid email/password combination"},
        status: :unauthorized
    end
  end

  private

  def safe_params
    params.permit(:email, :password)
  end
end
