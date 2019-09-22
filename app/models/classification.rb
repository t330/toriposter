class Classification < ApplicationRecord
  has_many :birds
  has_ancestry
end
