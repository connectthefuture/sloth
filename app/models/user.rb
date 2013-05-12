class User < ActiveRecord::Base
  attr_accessible :email, :name, :uid
  
  has_many :prototype
  
end
