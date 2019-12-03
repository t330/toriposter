class Map < ApplicationRecord
  belongs_to :post, inverse_of: :map

  validates :latitude, presence: true
  validates :longitude, presence: true
end
