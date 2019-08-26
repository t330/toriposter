class AddDetails4ToComments < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :photo, :text, null: false
    add_column :posts, :description, :text
    add_column :comments, :advice, :integer
  end
end