class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :email, null: false
      t.text :data
      t.integer :form_id, null: false

      t.timestamps null: false
    end
  end
end
