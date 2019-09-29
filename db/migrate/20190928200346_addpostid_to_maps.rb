class AddpostidToMaps < ActiveRecord::Migration[5.2]
  def change
    add_reference :maps, :post, foreign_key: true, index: true, null: false
  end
end
