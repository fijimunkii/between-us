# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  password   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  location   :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :password
  has_many :searches, :dependent => :destroy
end
