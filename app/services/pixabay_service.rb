class PixabayService

  def initialize
    @conn = Faraday.new(url: "https://pixabay.com/api/") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def get_animal_image
    response = @conn.get("?key=#{ENV["PIXABAY_KEY"]}&image_type=photo&q=animals&orientation=horizontal&category=animals&safesearch=true&per_page=200")
    parse(response)
  end

  private
    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
