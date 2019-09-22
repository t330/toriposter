class AddAncestryToClassifications < ActiveRecord::Migration[5.2]
  def change
    add_column :classifications, :ancestry, :string
    add_index :classifications, :ancestry
  end
end
