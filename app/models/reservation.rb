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

class Reservation < ApplicationRecord
  belongs_to :time_slot
  has_one :parking_place, :through => :time_slot


end
