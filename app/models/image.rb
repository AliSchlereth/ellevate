class Image

  def self.get_animal_image
    image_data = PixabayService.new.get_animal_image
  end

end
