class Adddetails6ToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :user, foreign_key: true, index: true, null: false
    add_reference :comments, :user, foreign_key: true, index: true, null: false
    add_reference :comments, :post, foreign_key: true, index: true, null: false
  end
end
