class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  has_many :maps

  mount_uploader :photo, PhotoUploader
end
