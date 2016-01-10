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
      render json: {
        status: 'ok',
        message: 'Saved!'
      }
    else
      render json: {
        status: :error,
        message: params.to_json,
        errors: @submission.errors.full_messages.to_sentence,
        status: :bad_request
      }
    end
  end

  private

  def find_form
    @form = Form.find_by(token: params[:token])
  end
end
