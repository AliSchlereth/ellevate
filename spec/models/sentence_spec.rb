require 'rails_helper'

RSpec.describe Sentence, type: :model do
  context "validations" do
    it "is invalid without a sentence_frame" do
      sent = Sentence.new(level: 3)

      expect(sent).to_not be_valid
    end

    it "is invalid without a level" do
      sent = Sentence.new(sentence_frame: "The____is____.")

      expect(sent).to_not be_valid
    end

    it "is valid with a level and sentence_frame" do
      sent = Sentence.new(level: 3, sentence_frame: "The____is____.")

      expect(sent).to be_valid
    end
  end

end
