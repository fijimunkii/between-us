# == Schema Information
#
# Table name: searches
#
#  id         :integer          not null, primary key
#  location   :string(255)
#  latitude   :float
#  longitude  :float
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Search < ActiveRecord::Base
  attr_accessible :location, :latitude, :longitude
  belongs_to :user
  geocoded_by :address
end
