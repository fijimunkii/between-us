# == Schema Information
#
# Table name: searches
#
#  id         :integer          not null, primary key
#  location   :string(255)
#  lat        :float
#  long       :float
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Search < ActiveRecord::Base
  attr_accessible :location, :lat, :long
  belongs_to :user
end
