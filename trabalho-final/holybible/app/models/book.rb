class Book < ApplicationRecord
  belongs_to :testament
  has_many :verse

end
