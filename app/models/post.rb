class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :bird_list
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :maps
  mount_uploader :photo, PhotoUploader
end
