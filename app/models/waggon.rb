class Waggon < ApplicationRecord
  belongs_to :train

  validates :number, presence: true, uniqueness: { scope: :train_id }
  before_validation :set_number

  TYPES = { EconomyWaggon => 'Economy',
            SleeperWaggon => 'Sleeper',
            SittingWaggon => 'Sitter',
            LuxeWaggon => 'Luxe' }.freeze

  scope :head, -> { order(:number) }
  scope :tail, -> { order(:number).reverse_order }

  def set_number
    self.number ||= train.waggons.maximum(:number).to_i + 1
  end

  def grab_types
    TYPES.map { |k, v| v if k.to_s == type }
  end
end
