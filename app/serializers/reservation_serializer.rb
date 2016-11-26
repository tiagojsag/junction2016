# == Schema Information
#
# Table name: reservations
#
#  id           :integer          not null, primary key
#  start        :datetime
#  end          :datetime
#  price        :float
#  time_slot_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :start, :end, :price
end
