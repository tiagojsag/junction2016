json.extract! time_slot, :id, :start, :end, :price, :created_at, :updated_at
json.url time_slot_url(time_slot, format: :json)