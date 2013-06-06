class View < ActiveRecord::Base
  attr_accessible :user
  
  belongs_to :user
  belongs_to :viewable, polymorphic: true
  
  validates :user, presence: true
  validates :user_id, uniqueness: {scope: [:viewable_id, :viewable_type]}
  validates :viewable, presence: true
end
