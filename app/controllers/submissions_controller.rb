class SubmissionsController < ActionController::Base
  skip_before_filter :verify_authenticity_token

  before_action :find_form, only: :create

  def create
    @submission = @form.submissions.new

    @submission.email = params[:email]
    @submission.data = params.except(
      :email, :token, :controller, :action
    ).to_json

    if @submission.save
      @submission.form.optional_notification_emails.split(',').each do |recipient|
        NewFormSubmissionMailer.new_submission(recipient, @submission).deliver
      end

      render json: {
        status: 'ok',
        message: 'Saved!'
      }, status: :ok
    else
      render json: {
        status: :error,
        errors: @submission.errors.full_messages.to_sentence,
      }, status: :bad_request
    end
  end

  private

  def find_form
    @form = Form.find_by(token: params[:token])
  end
end
