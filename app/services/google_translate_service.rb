class GoogleTranslateService

  def initialize
    @conn = Faraday.new(url: "https://translation.googleapis.com/language/translate/v2") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def translate(language_code, message)
    # response = Faraday.get("https://translation.googleapis.com/language/translate/v2?key=#{ENV["GOOGLE_API_KEY"]}&source=en&target=#{language_code}&q=#{message}")
    response = @conn.get("?key=#{ENV["GOOGLE_API_KEY"]}&source=en&target=#{language_code}&q=#{message}")
    parse(response)
  end

  private
    def parse(response)
        JSON.parse(response.body, symbolize_names: true)
    end
end
