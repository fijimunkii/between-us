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
#

class User < ActiveRecord::Base
  attr_accessible :email, :location, :latitude, :longitude, :password, :password_confirmation
  has_secure_password
  has_many :searches, :dependent => :destroy
  acts_as_gmappable #gmaps4rails
  geocoded_by :location #geocoder
  after_validation :geocode, :if => :location_changed? #geocoder
end
