# == Schema Information
#
# Table name: searches
#
#  id          :integer          not null, primary key
#  location    :string(255)
#  latitude    :float
#  longitude   :float
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Search < ActiveRecord::Base
  attr_accessible :location, :latitude, :longitude, :user_id
  belongs_to :user
  belongs_to :category
  acts_as_gmappable :process_geocoding => false
  def gmaps4rails_address
    self.location
  end
  geocoded_by :location
  after_validation :geocode
end
