class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    if session[:role] == "teacher"
      @current_user ||= Teacher.find(session[:id]) if session[:id]
    end
  end
  
end
