require "rails_helper"

describe "sentence requests" do
  context "get api/v1/sentence" do
    it "returns a sentence frame for current_users's level" do
      get "/api/v1/sentence"

      sentence = JSON.parse(resonse.body)

      expect(response).to be_success
      expect(sentence).to be_a(Sentence)
      expect(sentence.include?(".")).to be_truthy
      expect(setnence.include?("_____")).to be_truthy
    end
  end
end
