class Api::V1::ImagesController < ApplicationController

  def show
    image = Image.get_animal_image
    render json: image
  end

end
