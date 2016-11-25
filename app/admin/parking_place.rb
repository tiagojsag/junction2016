ActiveAdmin.register ParkingPlace do
  permit_params :title, :description, :latitude, :longitude, :address_one, :address_two, :zip_code, :city, :country
end
