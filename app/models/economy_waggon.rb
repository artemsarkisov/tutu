class EconomyWaggon < Waggon
  validates :side_upper_shelf, :side_lower_shelf, presence: true
end