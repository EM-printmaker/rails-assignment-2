class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.text :description
      t.integer :rate
      t.string :address
      t.string :room_image
      t.references :user, null: false

      t.timestamps
    end

    add_foreign_key :rooms, :users, on_delete: :cascade
  end
end
