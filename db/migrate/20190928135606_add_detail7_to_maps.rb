class AddDetail7ToMaps < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :latitude, :geometry
    add_column :maps, :longitude, :geometry
    #add_reference :posts, :map, foreign_key: true, index: true, null: false
  end
end
