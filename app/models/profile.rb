class Profile < ActiveRecord::Base
  attr_accessible :username

  validates :username, uniqueness: true
end
