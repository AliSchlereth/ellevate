require 'rails_helper'

RSpec.describe PassImg, type: :model do
  context "validations" do
    it "is invalid without an img" do
      pass = PassImg.new()

      expect(pass).to_not be_valid
    end

    it "is valid with an img" do
      pass = PassImg.new(img: "image")

      expect(pass).to be_valid
    end
  end

  context "relationships" do
    it "responds to students" do
      pass = PassImg.new(img: "image")

      expect(pass).to respond_to(:students)
    end
  end

end
