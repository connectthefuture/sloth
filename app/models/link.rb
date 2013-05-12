class Link < ActiveRecord::Base
  attr_accessible :height, :page_id, :pos_x, :pos_y, :width
  belongs_to :page
end
