# == Schema Information
#
# Table name: parking_places
#
#  id          :integer          not null, primary key
#  title       :text
#  description :text
#  latitude    :float
#  longitude   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ParkingPlaceSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :latitude, :longitude
end