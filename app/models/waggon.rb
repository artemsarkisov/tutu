class Waggon < ApplicationRecord

  validates_presence_of :number

  belongs_to :train
end
