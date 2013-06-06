class Prototype < ActiveRecord::Base
  attr_accessible :name, :description
  
  include Viewable
  include Heartable
  
  acts_as_permalink from: :name
  
  belongs_to :user
  has_many :pages, dependent: :destroy
  has_many :links, through: :pages
  
  validates :name, presence: true
  validates :user, presence: true  
  
  def default_image
    pages.first.current_version.image if pages.any?
  end
  
end
