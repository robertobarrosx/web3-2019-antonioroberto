class Verse < ApplicationRecord
  belongs_to :testament
  belongs_to :book
  has_many :ministry
end
