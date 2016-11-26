class CreateTimeSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :time_slots do |t|
      t.belongs_to :parking_place, index: true

      t.datetime :start_time
      t.datetime :end_time
      t.float :price_hour
      t.float :price_day
      t.integer :parking_place_id

      t.timestamps
    end
  end
end
