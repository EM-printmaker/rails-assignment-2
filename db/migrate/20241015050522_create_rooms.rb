class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.integer :rate
      t.string :address
      t.string :room_image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
