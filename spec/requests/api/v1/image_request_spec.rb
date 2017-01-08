require "rails_helper"

describe "image requests" do
  context "get api/v1/image" do
    it "returns an image url from the pixabay api" do
      get "/api/v1/image"

      image = JSON.parse(response.body)

      expect(response).to be_success
      expect(image).to have_key("image_url")
    end
  end
end
