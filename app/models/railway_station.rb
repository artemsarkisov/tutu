class RailwayStation < ApplicationRecord

  validates_presence_of :title

  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
end
