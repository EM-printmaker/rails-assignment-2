class AddColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :room, foreign_key: true
    add_foreign_key :reservations, :rooms, on_delete: :cascade
  end
end
