class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name, null: false
      t.string :redirect_url
      t.boolean :forward_query_string, default: false
      t.string :token, null: false

      t.timestamps null: false
    end
  end
end
