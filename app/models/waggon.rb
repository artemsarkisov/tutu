class Waggon < ApplicationRecord

  validates_presence_of :waggon_type, :upper_shelf, :lower_shelf

  belongs_to :train
end
