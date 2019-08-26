class RemoveDetails5FromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :user_id, :string
    remove_column :posts, :map_id, :string
    remove_column :comments, :user_id, :integer
  end
end
