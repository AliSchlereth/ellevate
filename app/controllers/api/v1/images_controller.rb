class Api::V1::ImagesController < ApplicationController

  def show
    response = Faraday.get("https://pixabay.com/api/?key=#{ENV["PIXABAY_KEY"]}&image_type=photo&q=animals&orientation=horizontal&category=animals&safesearch=true&per_page=200")
    imgae_data = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    # image = Image.get_animal_image
  end

end
