class Image

  def initialize(image_url)
    @image_url = image_url
  end

  def self.get_animal_image
    image_data = PixabayService.new.get_animal_image
  end

end
