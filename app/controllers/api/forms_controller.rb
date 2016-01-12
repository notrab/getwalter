class Api::FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def index
    respond_with current_user.forms
  end

  def show
    respond_with @form
  end

  def new
    Adapters::MixpanelAdapter.new.write(current_user.id, 'form.started')
    respond_with current_user.forms.new
  end

  def create
    @form = current_user.forms.new(safe_params)

    if @form.save
      Adapters::LibratoAdapter.new.increment(current_user, 'user.forms')
      Adapters::MixpanelAdapter.new.write(current_user.id, 'form.created', {
        'Form ID' => @form.id,
        'Form Name' => @form.name,
        'Forward Query String' => @form.forward_query_string
      })

      render json: {
        message: 'Form created successfully.',
        form: @form
      }, status: :ok
    else
      render json: {
        error: @submission.errors.full_messages.to_sentence
      }, status: :bad_request
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
    form_id, form_name = @form.id, @form.name
    @form.destroy
    Adapters::MixpanelAdapter.new.write(current_user.id, 'form.deleted', {
      'Form ID' => form_id,
      'Form Name' => form_name})
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