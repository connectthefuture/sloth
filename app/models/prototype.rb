class Prototype < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :user
  has_many :pages
  has_many :links, :through => :pages
  
end
