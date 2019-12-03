class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :bird_list
  belongs_to :user
  has_one :map, inverse_of: :post, dependent: :destroy
  accepts_nested_attributes_for :map
  has_many :comments, dependent: :destroy

  validates :photo, presence: true
  
  mount_uploader :photo, PhotoUploader
end
