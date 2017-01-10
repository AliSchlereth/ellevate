class GoogleTranslateService

  def self.translate(language_code, message)
    response = Faraday.get("https://translation.googleapis.com/language/translate/v2?key=#{ENV["GOOGLE_API_KEY"]}&source=en&target=#{language_code}&q=#{message}")
    translation = JSON.parse(response.body, symbolize_names: true)
  end

end
