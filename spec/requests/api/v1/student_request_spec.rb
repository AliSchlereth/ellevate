require "rails_helper"

describe "student requests by teacher" do
  before :each do
    @teacher = create(:teacher)
    @student1, @student2, @student3 = create_list(:student, 3, teacher: @teacher)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@teacher)
  end

  context "all students by teacher" do
    it "returns an array of students belonging to a teacher" do
      get "/api/v1/teachers/students"

      students = JSON.parse(response.body)
      expect(response).to be_success
      expect(students).to be_an(Array)
      expect(students.count).to eq(3)
      students.each do |student|
        expect(student['teacher_id']).to eq(@teacher.id)
        expect(student).to have_key("level")
        expect(student).to have_key("language")
        expect(student).to have_key("username")
        expect(student).to have_key("name")
      end
    end
  end

  context "delete student by student id" do
    it "delete a given student" do
      delete "/api/v1/teachers/students/#{@student1.id}"

      student = JSON.parse(response.body)

      expect(response).to be_success
      expect(student['id']).to eq(@student1.id)
    end
  end

  context "create student by teacher" do
    it "creates a student on current_user" do
      headers = {"CONTENT-TYPE" => "application/json"}
      params = {student: {name: "Create Name", username: "Create Username", language: "Spanish", level: 3, pass_img_id: 5}}.to_json

      post "/api/v1/teachers/students", params, headers

      student = JSON.parse(response.body)

      expect(response).to be_success
      expect(student['teacher_id']).to eq(@teacher.id)
    end
  end
end
