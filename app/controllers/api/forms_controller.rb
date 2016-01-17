class Api::FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def index
    respond_with current_user.forms
  end

  def show
    respond_with @form
  end

  def create
    @form = current_user.forms.new(safe_params.except(:optional_notification_emails))
    @form.optional_notification_emails = safe_params[:optional_notification_emails].join(',') if safe_params[:optional_notification_emails].present?

    if @form.save
      Adapters::LibratoAdapter.new.increment(current_user, 'user.forms')
      Adapters::MixpanelAdapter.new.people(current_user.id, {
        'Created Form' => true
      })

      Adapters::MixpanelAdapter.new.write(current_user.id, 'form.created', {
        'Form ID' => @form.id,
        'Form Name' => @form.name,
        'Forward Query String' => @form.forward_query_string
      })

      render json: {
        message: t('.success'),
        form: @form
      }, status: :ok
    else
      render json: {
        message: @form.errors.full_messages.to_sentence
      }, status: :bad_request
    end
  end

  def update
    updated_params = safe_params.except(:optional_notification_emails)
    @form.optional_notification_emails = safe_params[:optional_notification_emails].join(',') if safe_params[:optional_notification_emails].present?

    if @form.update_attributes(updated_params)
      Adapters::MixpanelAdapter.new.people(current_user.id, {
        'Updated Form' => true
      })

      render json: {
        message: "#{@form.name} was successfully updated."
      }, status: :ok
    else
      render json: {
        message: @form.errors.full_messages.to_sentence
      }, status: :bad_request
      render 'edit', notice: t('.error')
    end
  end

  def destroy
    form_id, form_name = @form.id, @form.name

    if @form.destroy
      Adapters::MixpanelAdapter.new.write(current_user.id, 'form.deleted', {
        'Form ID' => form_id,
        'Form Name' => form_name
      })

      render json: {
        message: t('.success', form_name: form_name)
      }, status: :ok
    else
      render json: {
        message: @form.errors.full_messages.to_sentence
      }, status: :bad_request
    end
  end

  private

  def safe_params
    params.require(:form).permit(:name,
      :redirect_url, :forward_query_string,
      :optional_notification_emails => []
    )
  end

  def set_form
    @form = current_user.forms.find(params[:id])
  end
end
