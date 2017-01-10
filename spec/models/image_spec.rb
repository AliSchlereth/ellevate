require "rails_helper"

describe "Image" do
  context "get_animal_image" do
    it "returns an image object" do
      image = Image.get_animal_image

      expect(image).to respond_to('image_url')
      expect(image).to respond_to('animal')
    end
  end
end
