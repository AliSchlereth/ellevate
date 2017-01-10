require "rails_helper"

describe "PixabayService" do
  context "get_animal_image" do
    it "returns parsed JSON for images" do
      images_info = PixabayService.new.get_animal_image

      expect(images_info).to be_a(Hash)
      expect(images_info).to have_key(:hits)
      expect(images_info[:hits].count).to eq(200)
      expect(images_info[:hits][0]).to have_key(:webformatURL)
      expect(images_info[:hits][0]).to have_key(:tags)
    end
  end
end
