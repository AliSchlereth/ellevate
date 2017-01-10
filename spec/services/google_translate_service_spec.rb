require "rails_helper"

describe "Google Translate Service" do
  context "translate" do
    it "returns a translated phrase" do
      translation = GoogleTranslateService.new.translate("de", "My name is Jeff.")

      expect(translation[:data]).to eq({:translations=>[{:translatedText=>"Mein Name ist Jeff."}]})
    end
  end
end
