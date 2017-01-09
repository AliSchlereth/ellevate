require "rails_helper"

describe "Translate PORO" do
  context "translate" do
    it "takes a language and message and returns a translation" do
      translations =  Translate.translate("german", "My name is Jeff.")
      translation = translations[0]
      expect(translation.message).to eq("Mein Name ist Jeff.")
    end
  end
end
