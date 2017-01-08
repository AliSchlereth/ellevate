class Api::V1::Teachers::StudentsController < ApplicationController

  def index
    students = current_user.students.order(:level)
    render json: students
  end

  def create
    student = current_user.students.new(student_params)
    if student.save
      render json: student
    else
      render json: {message: "Your student was not created"}, status: 404
    end
  end

  def update
    student = current_user.students.find(params[:id])
    student.update(student_params)
    pass_img = PassImg.find_by(img: params[:student][:pass_img])
    student.update(pass_img: pass_img)
    if student.save
      render json: student
    else
      render json: {message: "Unable to update student"}, status: 400
    end
  end

  def destroy
    student = current_user.students.find(params[:id])
    student.destroy
    render json: student
  end

  private
    def student_params
      params.require(:student).permit(:name, :username, :level, :language, :pass_img_id)
    end

end
