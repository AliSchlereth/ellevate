class Teachers::SessionsController < ApplicationController
  protect_from_forgery with: :null_session
  # skip_before_action :verify_authenticity_token, only: [:create]

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
