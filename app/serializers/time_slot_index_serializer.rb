# == Schema Information
#
# Table name: time_slots
#
#  id               :integer          not null, primary key
#  parking_place_id :integer
#  start_time       :datetime
#  end_time         :datetime
#  price_hour       :float
#  price_day        :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class TimeSlotIndexSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :price_hour, :price_day, :parking_place

  def parking_place
    ParkingPlaceIndexSerializer.new(object.parking_place, scope: scope, root: false)
  end
end
