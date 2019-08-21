class AddDetails2ToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :date, :string, null: false
  end
end
