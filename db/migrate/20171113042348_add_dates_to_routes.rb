class AddDatesToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :railway_stations_routes, :arrival_date, :datetime
    add_column :railway_stations_routes, :departure_date, :datetime
  end
end
