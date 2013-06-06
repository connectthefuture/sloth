class Heart < ActiveRecord::Base
  attr_accessible :user
  
  belongs_to :user
  belongs_to :heartable, polymorphic: true
  
  validates :user, presence: true
  validates :user_id, uniqueness: {scope: [:heartable_id, :heartable_type]}
  validates :heartable, presence: true
end
