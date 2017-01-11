class Teachers::SessionsController < ApplicationController
  protect_from_forgery with: :exception

  def create
    user = Teacher.update_or_create(env["omniauth.auth"])
    session[:id] = user.id
    session[:role] = "teacher"
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
