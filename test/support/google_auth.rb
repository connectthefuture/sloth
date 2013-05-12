class ActionController::TestCase
  def login(user=nil)
    user = FactoryGirl.create(:user) unless user
    session[:user_id] = user.id
    @current_user = user
  end
end
