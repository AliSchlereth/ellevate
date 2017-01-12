class Image

  attr_reader :image_url, :animal

  def initialize(image_url, animal)
    @image_url = image_url
    @animal = animal
  end

  def self.get_animal_image
    images_data = Rails.cache.fetch("images", expires_in: 24.hours) {PixabayService.new.get_animal_image}
    random_selector = rand(0..200)
    animal = Image.process_animal_tag(images_data, random_selector)
    image_url = images_data[:hits][random_selector][:webformatURL]
    Image.new(image_url, animal)
  end

  def self.process_animal_tag(images_data, random_selector)
    tag = images_data[:hits][random_selector][:tags]
    first_tag = tag.split(',')[0]
  end

end
