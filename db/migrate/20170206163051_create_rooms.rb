class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :capacity
      t.string :city
      t.integer :price
      t.string :address
      t.integer :average_rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
