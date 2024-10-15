class CreateHotelBills < ActiveRecord::Migration[6.1]
  def change
    create_table :hotel_bills do |t|
      t.integer :accommodation_fee
      t.date :lodgment_date
      t.references :room, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
