require "rails_helper"

describe "Image" do
  context "get_animal_image" do
    it "returns an image object" do
      image = Image.get_animal_image

      expect(image).to respond_to('image_url')
      expect(image).to respond_to('animal')
    end
  end

  context "process_animal_tag" do
    it "returns a selected string from split tags string" do
      image_data = {hits: [{tags: "one, two, three"}, {tags: "four, five, six"}]}

      tag = Image.process_animal_tag(image_data, 1)

      expect(tag).to be_a(String)
      expect(tag).to eq("four")
    end
  end
end
