# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  location        :string(255)
#  latitude        :float
#  longitude       :float
#  ip_address      :binary
#

class User < ActiveRecord::Base
  attr_accessible :email, :location, :latitude, :longitude, :password, :password_confirmation
  has_secure_password
  has_many :searches, :dependent => :destroy
  geocoded_by :ip_address
  after_create :geocode
  geocoded_by :location
  after_validation :geocode, :reverse_geocode, :if => :location_changed?
end
