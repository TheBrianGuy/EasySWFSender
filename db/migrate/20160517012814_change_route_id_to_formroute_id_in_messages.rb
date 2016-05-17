class ChangeRouteIdToFormrouteIdInMessages < ActiveRecord::Migration
  def change
    rename_column :messages, :route_id, :formroute_id
  end
end
