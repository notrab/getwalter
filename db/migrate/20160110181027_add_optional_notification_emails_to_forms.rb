class AddOptionalNotificationEmailsToForms < ActiveRecord::Migration
  def change
    add_column :forms, :optional_notification_emails, :string
  end
end
