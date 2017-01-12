class Api::V1::TranslationsController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    language = current_user.language
    message = params[:translation][:message]
    translation = Translate.translate(language, message)
    render json: translation
  end
end
