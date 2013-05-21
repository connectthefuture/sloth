class Comment < ActiveRecord::Base
  attr_accessible :body, :user
  
  belongs_to :user
  belongs_to :page_version
  
  delegate :page, :page_id, :version, to: :page_version
  
  validates :body, presence: true
  validate :has_both_coordinates
  
  def annotation?
    pos_x.present? || pos_y.present? # Can only check one as they need to both be set
  end
  
  private
  
  def has_both_coordinates
    errors.add(:base, "Both coordinates must be set") if pos_x.present? ^ pos_y.present?
  end
  
end
