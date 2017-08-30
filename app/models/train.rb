class Train < ApplicationRecord

  has_many :tickets
  has_many :waggons

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route

  validates :number, presence: true

  def waggons_count(type_of_waggon)
    self.waggons.where(waggon_type: type_of_waggon).count
  end

  def seats_count(type_of_waggon, type_of_shelf)
    self.waggons.where(waggon_type: type_of_waggon).sum(type_of_shelf)
  end
end