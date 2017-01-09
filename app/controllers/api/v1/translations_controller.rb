class Api::V1::TranslationsController < ApplicationController

  def show
    language = Student.first.language
    message = params[:translation][:message]
    translation = Translate.translate(language, message)
    render json: translation
  end
end
