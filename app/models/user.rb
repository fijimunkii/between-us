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

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  acts_as_gmappable :process_geocoding => false
  def gmaps4rails_address
    self.location
  end

end
