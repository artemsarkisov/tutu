class Train < ApplicationRecord

  has_many :tickets
  has_many :waggons

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route

  validates :number, presence: true

  def waggons_info(type_of_waggon)
    puts "Amount: #{self.waggons.where(waggon_type: type_of_waggon).count}"
    puts "Upper shelves: #{self.waggons.where(waggon_type: type_of_waggon).sum(:upper_shelf)}"
    puts "Lower shelves: #{self.waggons.where(waggon_type: type_of_waggon).sum(:lower_shelf)}"
  end
end