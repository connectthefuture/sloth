class PageVersion < ActiveRecord::Base
  attr_accessible :image
  
  acts_as_sequenced scope: :page_id, column: :version
  
  has_attached_file :image, styles: Settings.image_styles.to_hash, default_url: Settings.image_default_url
  
  belongs_to :page
  
  has_many :links, dependent: :destroy
  
  validates :image, attachment_presence: true


  def current?
    page.current_version == self
  end
  
end
