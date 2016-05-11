class RemoveUserIdFromFormroutes < ActiveRecord::Migration
  def change
    remove_column :formroutes, :user_id
  end
end
