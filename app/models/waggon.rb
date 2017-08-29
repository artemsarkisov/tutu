class Waggon < ApplicationRecord

  belongs_to :train

  validates :waggon_type, :upper_shelf, :lower_shelf, presence:  true

end
