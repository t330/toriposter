class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|

      t.timestamps
    end
  end
end
