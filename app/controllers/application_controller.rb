# Application Controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Check if user is logged in
  helper_method def logged_in?
    session[:user_id]
  end

  # Check if the requested user is the current user
  helper_method def current_user
    @user ||= User.find(session[:user_id]) if logged_in?
  end

  helper_method def admin?
    current_user.admin? if logged_in?
  end
end
