class AddDetailsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :photo, :text
    add_column :posts, :name, :string
    add_column :posts, :map_id, :string
    add_column :posts, :user_id, :string
  end
end
