class CreateFormroutes < ActiveRecord::Migration
  def change
    create_table :formroutes do |t|
      t.string :name
      t.string :key
      t.string :page
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
