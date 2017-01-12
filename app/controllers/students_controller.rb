class StudentsController < ApplicationController

  def show
    @student = current_user
    @sentence = @student.sentence_frame
  end

end
