class ChangeNull < ActiveRecord::Migration[5.2]
  def change

    change_column :posts, :date, :date, null: true

  end
end
