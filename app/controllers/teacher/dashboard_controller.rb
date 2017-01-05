class Teacher::DashboardController < ApplicationController

  def show
    @student = Student.new
    @pass_imgs = PassImg.all
  end
  
end
