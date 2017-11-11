class SleeperWaggon < Waggon
  validates :upper_shelf, :lower_shelf, presence: true
end