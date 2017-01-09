class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
    @sentence = @student.sentence_frame
  end

end
