json.extract! parking_place, :id, :title, :description, :latitude, :longitude, :created_at, :updated_at
json.url parking_place_url(parking_place, format: :json)