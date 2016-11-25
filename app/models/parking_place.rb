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

class ParkingPlace < ApplicationRecord
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode, if: ->(obj){ obj.full_street_address.present? and obj.full_street_address_changed? }

  def full_street_address
    "#{self.address_one} #{self.address_one} #{self.address_two} #{self.zip_code} #{self.city} #{self.country}"
  end

  def full_street_address_changed?
    self.address_one_changed? or self.address_one_changed? or self.address_two_changed? or self.zip_code_changed? or self.city_changed? or self.country_changed?
  end
end
