class AddCcUserInRecipients < ActiveRecord::Migration
  def change
    add_column :forms, :cc_user_in_recipients, :boolean, default: true
  end
end
