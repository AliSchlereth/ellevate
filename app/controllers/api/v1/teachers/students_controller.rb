class Api::V1::Teachers::StudentsController < ApplicationController

  def index
    students = current_user.students.order(:level)
    render json: students
  end

  def create
    binding.pry
  end

  def destroy
    student = current_user.students.find(params[:id])
    student.destroy
    render json: student
  end

end
