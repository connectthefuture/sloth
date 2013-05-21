class PageVersion < ActiveRecord::Base
  attr_accessible :image
  
  acts_as_sequenced scope: :page_id, column: :version
  
  has_attached_file :image, styles: Settings.image_styles.to_hash, default_url: Settings.image_default_url
  
  belongs_to :page
  
  has_many :links, dependent: :destroy
  has_many :comments
  
  validates :image, attachment_presence: true

  after_save :copy_links_from_previous_version, on: :create

  def current?
    page.current_version == self
  end
  
  def previous_version
    page.page_versions.where("version < ?", version).order("version DESC").first if page
  end
  
  private
  
  def copy_links_from_previous_version
    (previous_version.try(:links) || []).each do |link|
      links.create!(pos_x: link.pos_x, pos_y: link.pos_y, width: link.width, height: link.height)
    end
    
    true
  end
  
end
