class Ministry < ApplicationRecord
  belongs_to :user
  belongs_to :church
  has_many :verse
  mount_uploader :picture, PictureUploader
end
