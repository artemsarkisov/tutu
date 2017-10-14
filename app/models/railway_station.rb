class RailwayStation < ApplicationRecord

  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true
  
  scope :ordered, -> {order(:position)}

  def number_in_route(route, order_number)
    station = RailwayStationsRoute.find_by(route: route, railway_station: self)
    station.position = order_number
    station.save
  end
end

# Rails Console
# st = RailwayStation.first
# st.save
# st.routes
# rt = Route.first
# rt.save
# rt.railway_stations
# st.number_in_route(rt, 1)