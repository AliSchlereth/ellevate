require 'rails_helper'

RSpec.describe Student, type: :model do
  context "validations" do
    it "stu invalid without a username" do
      teacher =  Teacher.create(
              provider: "google",
              uid: "12345678910",
              email: "first@email.com",
              first_name: "First",
              last_name: "Last",
              token: "abcdefg12345",
              refresh_token: "12345abcdefg",
              oauth_expires_at: DateTime.now
            )
      pass_img = PassImg.create(img: "http://image.jpg")
      stu = Student.new(name: "Name", level: 3, language: "Somali", teacher: teacher, pass_img: pass_img)

      expect(stu).to_not be_valid
    end

    it "stu invalid without a level" do
      teacher =  Teacher.create(
              provider: "google",
              uid: "12345678910",
              email: "first@email.com",
              first_name: "First",
              last_name: "Last",
              token: "abcdefg12345",
              refresh_token: "12345abcdefg",
              oauth_expires_at: DateTime.now
            )
      pass_img = PassImg.create(img: "http://image.jpg")
      stu = Student.new(name: "Name", username: "username", language: "Somali", teacher: teacher, pass_img: pass_img)

      expect(stu).to_not be_valid
    end

    it "stu invalid without a language" do
      teacher =  Teacher.create(
              provider: "google",
              uid: "12345678910",
              email: "first@email.com",
              first_name: "First",
              last_name: "Last",
              token: "abcdefg12345",
              refresh_token: "12345abcdefg",
              oauth_expires_at: DateTime.now
            )
      pass_img = PassImg.create(img: "http://image.jpg")
      stu = Student.new(name: "Name", username: "username", level: 3, teacher: teacher, pass_img: pass_img)

      expect(stu).to_not be_valid
    end

    it "stu is valid with a username, level, and langauge" do
      teacher =  Teacher.create(
              provider: "google",
              uid: "12345678910",
              email: "first@email.com",
              first_name: "First",
              last_name: "Last",
              token: "abcdefg12345",
              refresh_token: "12345abcdefg",
              oauth_expires_at: DateTime.now
            )
      pass_img = PassImg.create(img: "http://image.jpg")
      stu = Student.create(name: "Name", username: "username", level: 3, language: "Somali", teacher: teacher, pass_img: pass_img)

      expect(stu).to be_valid
    end
  end

  context "relationships" do
    it "responds to teacher" do
      teacher =  Teacher.create(
              provider: "google",
              uid: "12345678910",
              email: "first@email.com",
              first_name: "First",
              last_name: "Last",
              token: "abcdefg12345",
              refresh_token: "12345abcdefg",
              oauth_expires_at: DateTime.now
            )
      pass_img = PassImg.create(img: "http://image.jpg")
      stu = Student.create(name: "Name", username: "username", level: 3, language: "Somali", teacher: teacher, pass_img: pass_img)

      expect(stu).to respond_to(:teacher)
    end

    it "responds to pass_img" do
      teacher =  Teacher.create(
              provider: "google",
              uid: "12345678910",
              email: "first@email.com",
              first_name: "First",
              last_name: "Last",
              token: "abcdefg12345",
              refresh_token: "12345abcdefg",
              oauth_expires_at: DateTime.now
            )
      pass_img = PassImg.create(img: "http://image.jpg")
      stu = Student.create(name: "Name", username: "username", level: 3, language: "Somali", teacher: teacher, pass_img: pass_img)

      expect(stu).to respond_to(:pass_img)
    end
  end

end
