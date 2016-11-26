json.extract! reservation, :id, :start, :end, :price, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)