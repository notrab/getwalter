class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.default_mail_sender
  layout 'mailer'
end
