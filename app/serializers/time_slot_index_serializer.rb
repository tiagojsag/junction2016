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
  attributes :id, :start_time, :end_time, :price_hour, :price_day

  belongs_to :parking_place

end
