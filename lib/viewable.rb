module Viewable
  extend ActiveSupport::Concern
  
  included do
    has_many :views, as: :viewable
  end
  
  def view(user)
    views.create(user: user)
  end
  
  def view_count
    views.count
  end
  
end
