class Api::V1::ImagesController < ApplicationController

  def show
    response = Faraday.get("https://pixabay.com/api/?key=#{ENV["PIXABAY_KEY"]}&image_type=photo&q=animals&orientation=horizontal&category=animals&safesearch=true&per_page=200")
    images_data = JSON.parse(response.body, symbolize_names: true)
    random_selector = rand(0..200)
    image_url = images_data[:hits][random_selector][:webformatURL]
    image = Image.new(image_url)
    render json: image

    # image = Image.get_animal_image
  end

end
