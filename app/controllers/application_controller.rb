class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
    #find user if there is a session_id
    User.find session[:user_id] if session[:user_id]
  end

end
