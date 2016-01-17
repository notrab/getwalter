class SubmissionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  before_action :find_form, only: :create

  def create
    @forward_params = params.except(
      :token, :controller, :action)

    params = ActionController::Parameters.new({
      submission: {
        email: @forward_params[:email],
        data: @forward_params.except(:email, :token).to_json
      }
    })

    permitted = params.require(:submission).permit(:email, :data)

    @submission = @form.submissions.new(permitted)

    if @submission.save
      @submission.form.recipients.split(',').each do |recipient|
        NewFormSubmissionMailer.new_submission(recipient, @submission).deliver
        Adapters::MixpanelAdapter.new.write(@submission.email, 'form.submission.created', {
          'Form Name' => @form.name,
          'Recipients' => @form.recipients.split(',').to_s,
          'Submitted by' => @submission.email})
      end

      if request.xhr?
        render json: { message: t('.success') }, status: :ok
      else
        redirect_to thanks_path(@forward_params)
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
