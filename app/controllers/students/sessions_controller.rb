class Students::SessionsController < ApplicationController

  def new
    @pass_imgs = PassImg.all
  end

  def create
    student = Student.find_by(username: params[:username])
    teacher = Teacher.find_by(last_name: params[:teacher])
    pass_img = PassImg.find_by(img: params[:pass_imgs])
    if student && student.teacher == teacher && student.pass_img == pass_img
      session[:id] = student.id
      session[:role] = "student"
      redirect_to student_path(student)
    else
      flash[:alert] = "Log In did not work. Wrong information."
      redirect_to student_login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
