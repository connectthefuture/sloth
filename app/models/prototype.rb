class Prototype < ActiveRecord::Base
  attr_accessible :name, :description
  
  acts_as_permalink from: :name
  
  belongs_to :user
  has_many :pages, dependent: :destroy
  has_many :links, through: :pages

  validates :name, presence: true
  validates :user, presence: true  
  
  
end
