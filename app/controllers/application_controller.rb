class ApplicationController < ActionController::Base
  include GoogleAuth::Controller
  protect_from_forgery
  prepend_before_filter :login_by_token

  def login_by_token
    @current_user = User.find_by_token(params[:token]) if params[:token]
  end
end
