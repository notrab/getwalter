class Form < ActiveRecord::Base
  belongs_to :user
  has_many :submissions, dependent: :destroy

  has_secure_token

  validates :name, presence: true

  before_validation :validate_optional_emails

  def recipients
    [optional_notification_emails, user.email]
  end

  def as_json(options={})
    super(options.merge(include: [:user, :submissions]))
  end

  private

  def validate_optional_emails
    if optional_notification_emails.present?
      optional_emails = self.optional_notification_emails.strip.downcase.split(/[\s,]+/)

      optional_emails.each do |e|
        self.errors.add(:optional_notification_emails, "invalid email") unless e =~ /([^\s]+)@([^\s]+)/
      end

      self.optional_notification_emails = optional_emails.join(',')
    end
  end
end
