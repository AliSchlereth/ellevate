class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  helper_method :current_user

  def current_user
    @current_user ||= Teacher.find(session[:id]) if session[:id]
  end
end
