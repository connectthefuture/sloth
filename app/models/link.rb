class Link < ActiveRecord::Base
  attr_accessible :height, :page_version_id, :page_version, :pos_x, :pos_y, :width

  belongs_to :page_version

  validates :page_version, presence: true

end
