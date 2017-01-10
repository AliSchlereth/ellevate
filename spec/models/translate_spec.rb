require "rails_helper"

describe "Translate PORO" do
  context "translate" do
    it "takes a language and message and returns a translation" do
      translation =  Translate.translate("german", "My name is Jeff.")
      
      expect(translation.message).to eq("Mein Name ist Jeff.")
    end
  end
end
