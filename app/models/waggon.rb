class Waggon < ApplicationRecord
  belongs_to :train

  validates :number, :waggon_type, presence: true
  before_validation :set_number

  scope :economy, -> {where(type: 'EconomyWaggon')}
  scope :sleeper, -> {where(type: 'SleeperWaggon')}
  scope :luxe, -> {where(type: 'LuxeWaggon')}
  scope :sitting, -> {where(type: 'SittingWaggon')}
  scope :ordered, -> {order(:number)}

  def set_number
    self.number ||= train.waggons.maximum(:number).to_i + 1
  end
end
