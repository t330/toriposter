class Map < ApplicationRecord
  belongs_to :post, inverse_of: :map
end
