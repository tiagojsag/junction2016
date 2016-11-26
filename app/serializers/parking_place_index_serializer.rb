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
#  address_one :string
#  address_two :string
#  zip_code    :string
#  city        :string
#  country     :string
#

class ParkingPlaceIndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :latitude, :longitude
end
