class RenameCommentContent < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :comment, :text
    add_column :comments, :content, :text
    change_column :posts, :photo, :string
  end
end