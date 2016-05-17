class AddUserIdToFormroute < ActiveRecord::Migration
  def change
    add_column :formroutes, :user_id, :integer
    add_index :formroutes, :user_id
  end
end
