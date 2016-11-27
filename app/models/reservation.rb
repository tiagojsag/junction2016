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

class Reservation < ApplicationRecord
  belongs_to :time_slot
  has_one :parking_place, :through => :time_slot

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :price, presence: true
  # validates :time_slot_id, presence: true
end
