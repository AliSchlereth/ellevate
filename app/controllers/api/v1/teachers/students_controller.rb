class Api::V1::Teachers::StudentsController < ApplicationController

  def index
    students = current_user.students.order(:level)
    render json: students
  end

end
