class AddFormRouteIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :route_id, :integer
    add_index :messages, :route_id
  end
end
