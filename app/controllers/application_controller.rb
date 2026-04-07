class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_login
    unless logged_in?
      flash[:alert] = "Please log in to continue"
      redirect_to login_path
    end
  end
  
  def require_guest
    if logged_in?
      flash[:notice] = "You are already logged in"
      redirect_to root_path
    end
  end
end
