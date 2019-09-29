class AddDetail8ToMaps < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :latitude, :string, null: false
    add_column :maps, :longitude, :string, null: false
  end
end
