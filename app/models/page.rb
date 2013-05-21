class Page < ActiveRecord::Base
  attr_accessible :name, :page_versions_attributes

  belongs_to :prototype
  
  has_many :page_versions, dependent: :destroy, order: "version DESC"
  has_many :comments, through: :page_versions

  validates :name, presence: true

  accepts_nested_attributes_for :page_versions 

  def current_version
    page_versions.first
  end
  
end
