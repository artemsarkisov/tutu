class Waggon < ApplicationRecord
  belongs_to :train

  validates :number, :waggon_type, :upper_shelf, :lower_shelf, presence: true

  scope :economy, -> { where(type: 'EconomyWaggon') }
  scope :sleeper, -> { where(type: 'SleeperWaggon') }
  scope :ordered, -> { order(:number) }
end
