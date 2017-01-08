class Image

  def initialize(image_url)
    @image_url = image_url
  end

  def self.get_animal_image
    images_data = PixabayService.new.get_animal_image
    random_selector = rand(0..200)
    image_url = images_data[:hits][random_selector][:webformatURL]
    Image.new(image_url)
  end

end
