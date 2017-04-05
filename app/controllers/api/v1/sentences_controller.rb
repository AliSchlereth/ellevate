class Api::V1::SentencesController < ApplicationController

  def show
    sentence = current_user.sentence_frame
    render json: sentence
  end

end
