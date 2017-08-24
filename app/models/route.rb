class Route < ApplicationRecord
  validates_presence_of :name

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains
end