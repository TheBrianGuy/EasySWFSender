class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :fwd_msg_to
      t.string :msg_from_site
      t.string :msg_from_email
      t.string :msg_from_name
      t.string :msg_from_ipaddress
      t.string :msg_subject
      t.text :msg

      t.timestamps null: false
    end
  end
end
