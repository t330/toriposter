class RemoveColumnFromMaps < ActiveRecord::Migration[5.2]
  def change
    remove_column :maps, :latitude, :geomerty
    remove_column :maps, :longitude, :geometry
  end
end
