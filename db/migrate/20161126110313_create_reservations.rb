class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.datetime :start
      t.datetime :end
      t.float :price
      t.integer :time_slot_id

      t.timestamps
    end
  end
end
