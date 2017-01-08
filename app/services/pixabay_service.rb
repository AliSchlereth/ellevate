class PixabayService

  def get_animal_image
    response = Faraday.get("https://pixabay.com/api/?key=#{ENV["PIXABAY_KEY"]}&image_type=photo&q=animals&orientation=horizontal&category=animals&safesearch=true&per_page=200")
    images_data = JSON.parse(response.body, symbolize_names: true)
  end
end
