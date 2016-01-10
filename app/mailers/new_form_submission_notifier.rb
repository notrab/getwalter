class NewFormSubmissionNotifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.new_form_submission_notifier.message.subject
  #
  def message
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
