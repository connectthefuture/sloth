class Page < ActiveRecord::Base
  attr_accessible :image, :name
  belongs_to :prototype
  has_many :links
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
