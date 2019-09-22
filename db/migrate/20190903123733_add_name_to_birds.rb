class AddNameToBirds < ActiveRecord::Migration[5.2]
  def change
    add_column :classifications, :name, :text
  end
end
