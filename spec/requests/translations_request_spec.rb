require "rails_helper"

describe "translation requests" do
  context "POST api/v1/translations" do
    it "returns a message translated by student's native language" do
      student = create(:student)
      headers = {"CONTENT-TYPE" => "application/json"}
      params = {translation: {message: "This is a message."}}.to_json

      post "/api/v1/translation", params: params, headers: headers

      message = JSON.parse(response.body)

      expect(response).to be_success
      expect(message).to have_key('message')
      expect(message['message']).to eq("Este es un mensaje.")
    end
  end
end
