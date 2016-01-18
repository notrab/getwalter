class SessionsController < ApplicationController
  skip_before_action :authenticate, only: :create

  def create
    return render json: {error: 'Invalid email supplied.'} if safe_params.empty?

    user = User.find_by(email: safe_params.delete(:email).downcase)

    if user && user.authenticate(safe_params.delete(:password))
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
