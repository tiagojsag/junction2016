# == Schema Information
#
# Table name: reservations
#
#  id           :integer          not null, primary key
#  start_time   :datetime
#  end_time     :datetime
#  price        :float
#  time_slot_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ReservationSerializer < ActiveModel::Serializer
  attributes :id
end
