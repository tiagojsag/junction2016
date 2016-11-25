class CreateParkingPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :parking_places do |t|
      t.text :title
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
