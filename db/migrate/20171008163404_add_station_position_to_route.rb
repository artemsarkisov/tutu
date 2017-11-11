class AddStationPositionToRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :railway_stations_route, :position, :integer
  end
end
