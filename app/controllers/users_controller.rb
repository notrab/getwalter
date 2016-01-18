class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:create, :authenticate]

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
    if AuthToken.valid?(safe_params.delete(:token))
      render nothing: true, status: :ok
    else
      render nothing: true, status: :unauthorized
    end
  end

  private

  def safe_params
    params.permit(:name, :email, :password, :token)
  end
end
