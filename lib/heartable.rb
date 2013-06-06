module Heartable
  extend ActiveSupport::Concern
  
  included do
    has_many :hearts, as: :heartable
  end
  
  def heart(user)
    if hearted_by?(user)
      hearts.where(user: user).destroy_all.any?
    else
      hearts.create(user: user)
    end
  end
  
  def hearted_by?(user)
    hearts.where(user: user).any?
  end
  
  def heart_count
    hearts.count
  end
  
end
