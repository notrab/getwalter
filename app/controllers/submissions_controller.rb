class SubmissionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  before_action :find_form, only: :create

  def create
    @submission = @form.submissions.new

    @submission.email = params[:email]
    @submission.data = params.except(
      :email, :token, :controller, :action
    ).to_json

    if @submission.save
      @submission.form.recipients.split(',').each do |recipient|
        NewFormSubmissionMailer.new_submission(recipient, @submission).deliver
        Adapters::MixpanelAdapter.new.write(@submission.email, 'form.submission.created', {
          'Form Name' => @form.name,
          'Recipients' => @form.recipients.split(',').to_s,
          'Submitted by' => @submission.email})
      end

      if request.xhr?
        render json: {
          message: 'Thanks. We have received your submission. Someone will be in touch shortly.'
        }, status: :ok
      else
        redirect_to thanks_path
      end
    else
      if request.xhr?
        render json: {
          status: :error,
          errors: @submission.errors.full_messages.to_sentence,
        }, status: :bad_request
      else
        redirect_to oops_path
      end
    end
  end

  private

  def find_form
    @form = Form.find_by(token: params[:token])
  end
end
