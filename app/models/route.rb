class Route < ApplicationRecord
	
	has_many :railway_stations_routes
	has_many :railway_stations, through: :railway_stations_routes
	has_many :trains
	
	validates :name, presence: true
	validate :stations_count
	
	before_validation :set_name
	
	scope :sort_by_station, ->(route_id) {RailwayStationsRoute.order(:position)}
	
	private
	
	def set_name
		self.name ||= "#{railway_stations.first.title} - #{railway_stations.last.title}"
	end
	
	def stations_count
		if railway_stations.size < 2
			errors.add(:base, "Route should contain at least two stations")
		end
	end
end

# Route.all
# Route.sort_by_station(route_id)
