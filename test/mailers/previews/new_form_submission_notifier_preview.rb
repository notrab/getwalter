# Preview all emails at http://localhost:3000/rails/mailers/new_form_submission_notifier
class NewFormSubmissionNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/new_form_submission_notifier/message
  def message
    NewFormSubmissionNotifier.message
  end

end
