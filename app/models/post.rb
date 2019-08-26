class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :maps

  mount_uploader :photo, PhotoUploader
end
