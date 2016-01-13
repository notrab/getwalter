class AddBetaAccessToUsers < ActiveRecord::Migration
  def change
    add_column :users, :beta_access, :boolean, default: false
  end
end
