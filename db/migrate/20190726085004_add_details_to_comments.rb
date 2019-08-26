class AddDetailsToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :comment, :text
    add_column :comments, :user_id, :integer
  end
end
