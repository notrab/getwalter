class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  def show
    @submissions = @form.submissions
  end

  def new
    @form = current_user.forms.new
  end

  def create
    @form = current_user.forms.new(safe_params)

    if @form.save
      Adapters::LibratoAdapter.new.increment(current_user, 'user.forms')
      Adapters::MixpanelAdapter.new.write(current_user.id, 'form.created')

      redirect_to @form
    else
      render :new, notice: "Something went wrong."
    end
  end

  def update
    if @form.update_attributes(safe_params)
      redirect_to @form
    else
      render 'edit', notice: 'Something went wrong.'
    end
  end

  def destroy
    @form.destroy
    redirect_to root_path
  end

  private

  def safe_params
    params.require(:form).permit(:name,
      :redirect_url, :forward_query_string,
      :optional_notification_emails
    )
  end

  def set_form
    @form = current_user.forms.find(params[:id])
  end
end
