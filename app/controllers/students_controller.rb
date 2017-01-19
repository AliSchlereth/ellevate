class StudentsController < ApplicationController

  def show
    @sentence_frame = current_user.sentence_frame.sentence_frame
  end

end
