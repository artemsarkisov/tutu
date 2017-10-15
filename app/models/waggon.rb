class Waggon < ApplicationRecord
  belongs_to :train

  validates :number, :waggon_type, presence: true

  scope :economy, -> { where(type: 'EconomyWaggon') }
  scope :sleeper, -> { where(type: 'SleeperWaggon') }
  scope :luxe, -> { where(type: 'LuxeWaggon') }
  scope :sitting, -> { where(type: 'SittingWaggon') }
  scope :ordered, -> { order(:number) }
end
