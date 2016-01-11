class UsersController < Clearance::UsersController
  before_action :require_login, only: [:edit, :update]

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      Adapters::MixpanelAdapter.new.people(current_user.id, {
        '$first_name' => current_user.first_name,
        '$last_name' => current_user.last_name,
        '$email' => current_user.email
      })

      redirect_to my_account_path
    else
      render action: :edit
    end
  end

  private

  def url_after_create
    Adapters::MixpanelAdapter.new.people(@user.id, {
      '$first_name' => @user.first_name,
      '$last_name' => @user.last_name,
      '$email' => @user.email
    })
    super
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    name = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.name = name
    end
  end
end
