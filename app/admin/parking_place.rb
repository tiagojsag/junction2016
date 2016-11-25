ActiveAdmin.register ParkingPlace do
  permit_params :title, :description, :latitude, :longitude
end
