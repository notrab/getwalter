class NewFormSubmissionMailer < ApplicationMailer
  def new_submission(recipient, submission)
    @submission = submission

    mail to: recipient,
      subject: 'New form submission from Walter'
  end
end
