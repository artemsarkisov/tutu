class Waggon < ApplicationRecord
  belongs_to :train

  validates :number, :waggon_type, presence: true

  scope :economy, -> { where(type: 'EconomyWaggon') }
  scope :sleeper, -> { where(type: 'SleeperWaggon') }
  scope :sleeper, -> { where(type: 'LuxeWaggon') }
  scope :sleeper, -> { where(type: 'SittingWaggon') }
  scope :ordered, -> { order(:number) }
end
