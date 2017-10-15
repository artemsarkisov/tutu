class EconomyWaggon < Waggon
  validates :upper_shelf, :lower_shelf, :side_upper_shelf, :side_lower_shelf, presence: true
end