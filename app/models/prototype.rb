class Prototype < ActiveRecord::Base
  attr_accessible :name, :description
  
  belongs_to :user
  has_many :pages
  has_many :links, :through => :pages

  validates :name, presence: true
  validates :user, presence: true  
end
