class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def number_in_route(route, order_number)
    station          = RailwayStationsRoute.find_by(route: route, railway_station: self)
    station.position = order_number
    station.save
  end

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position)
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def update_time(route, state, time)
    station_route = station_route(route)
    station_route.update(state => time)
  end

  def time_in(route)
    station_route(route).try(:strftime, "%Y-%M-%D, %H:%M")
  end

  private

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
