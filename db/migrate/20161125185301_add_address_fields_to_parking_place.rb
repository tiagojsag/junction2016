class AddAddressFieldsToParkingPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :parking_places, :address_one, :string
    add_column :parking_places, :address_two, :string
    add_column :parking_places, :zip_code, :string
    add_column :parking_places, :city, :string
    add_column :parking_places, :country, :string
  end
end
