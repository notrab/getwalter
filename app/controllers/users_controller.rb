class UsersController < Clearance::UsersController
  before_action :require_login, only: [:edit, :update]

  def show
    render json: current_user.to_json
  end

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
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

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    name = user_params.delete(:name)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.name = name
    end
  end
end
