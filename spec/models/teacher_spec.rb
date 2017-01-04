require 'rails_helper'

RSpec.describe Teacher, type: :model do


  context "update_or_create" do
    it "creates or updates itself from an oauth hash" do
      auth = {
        provider: "google",
        uid: "12345678910",
        info: {
          email: "first@email.com",
          first_name: "First",
          last_name: "Last"
        },
        credentials: {
          token: "abcdefg12345",
          refresh_token: "12345abcdefg",
          expires_at: DateTime.now
        }
      }

      Teacher.update_or_create(auth)
      new_teacher = Teacher.first

      expect(new_teacher.provider).to eq("google")
      expect(new_teacher.uid).to eq("12345678910")
      expect(new_teacher.email).to eq("first@email.com")
      expect(new_teacher.first_name).to eq("First")
      expect(new_teacher.last_name).to eq("Last")
      expect(new_teacher.token).to eq("abcdefg12345")
      expect(new_teacher.refresh_token).to eq("12345abcdefg")
      expect(new_teacher.oauth_expires_at).to eq(auth[:credentials][:expires_at])
    end
  end

  context "validations" do
    it "is invalid without a uid" do
      user = Teacher.new(
        provider: "google",
        email: "first@email.com",
        first_name: "First",
        last_name: "Last",
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        oauth_expires_at: DateTime.now
      )

      expect(user).to_not be_valid
    end

    it "is invalid without a provider" do
      user = Teacher.new(
        uid: "12345678910",
        email: "first@email.com",
        first_name: "First",
        last_name: "Last",
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        oauth_expires_at: DateTime.now
      )

      expect(user).to_not be_valid
    end

    it "is invalid without an email" do
      user = Teacher.new(
        provider: "google",
        uid: "12345678910",
        first_name: "First",
        last_name: "Last",
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        oauth_expires_at: DateTime.now
      )

      expect(user).to_not be_valid
    end

    it "is invalid without a first_name" do
      user = Teacher.new(
        provider: "google",
        uid: "12345678910",
        email: "first@email.com",
        last_name: "Last",
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        oauth_expires_at: DateTime.now
      )

      expect(user).to_not be_valid
    end

    it "is invalid without a last_name" do
      user = Teacher.new(
        provider: "google",
        uid: "12345678910",
        email: "first@email.com",
        first_name: "First",
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        oauth_expires_at: DateTime.now
      )

      expect(user).to_not be_valid
    end

    it "is invalid without a token" do
      user = Teacher.new(
        provider: "google",
        uid: "12345678910",
        email: "first@email.com",
        first_name: "First",
        last_name: "Last",
        refresh_token: "12345abcdefg",
        oauth_expires_at: DateTime.now
      )

      expect(user).to_not be_valid
    end
  end

  context "relationships" do
    it "responds to students" do
      user = Teacher.new(
        provider: "google",
        uid: "12345678910",
        email: "first@email.com",
        first_name: "First",
        last_name: "Last",
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        oauth_expires_at: DateTime.now
      )
      expect(user).to respond_to(:students)
    end
  end

end
