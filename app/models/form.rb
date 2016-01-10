class Form < ActiveRecord::Base
  has_many :submissions

  has_secure_token

  validates :name, presence: true

  before_validation :validate_optional_emails

  private

  def validate_optional_emails
    optional_emails = self.optional_notification_emails.strip.downcase.split(/\[s+,]+/)

    optional_emails.each do |e|
      self.errors.add(:optional_notification_emails, "invalid email") unless e =~ /([^\s]+)@([^\s]+)/
    end

    self.optional_notification_emails = optional_emails.join(',')
  end
end
