ActiveAdmin.register TimeSlot do
  permit_params :start_time, :description, :latitude, :longitude, :address_one, :address_two, :zip_code, :city, :country
end
