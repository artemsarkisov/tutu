class Train < ApplicationRecord
  validates_presence_of :number

  has_many :tickets
  has_many :waggons

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
end
