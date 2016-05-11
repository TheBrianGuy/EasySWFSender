class AddFwdToEmailToFormroutes < ActiveRecord::Migration
  def change
    add_column :formroutes, :fwd_to_email, :string
  end
end
