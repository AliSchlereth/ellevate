require "rails_helper"

describe "sentence requests" do
  context "get api/v1/sentence" do
    it "returns a sentence frame for current_users's level" do
      student = create(:student)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(student)
      create_list(:sentence, 20, level: student.level)
      get "/api/v1/sentence"

      sentence = JSON.parse(response.body)

      expect(response).to be_success
      expect(sentence).to have_key('sentence_frame')
      expect(sentence['sentence_frame'].include?(".")).to be_truthy
      expect(sentence['sentence_frame'].include?("_____")).to be_truthy
    end
  end
end
