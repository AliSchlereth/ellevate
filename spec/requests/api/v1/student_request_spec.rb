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
      params = {student: {name: "Create Name", username: "Create Username", language: "Spanish", level: 3, pass_img_id: @student1.pass_img_id}}.to_json

      post "/api/v1/teachers/students", params: params, headers: headers

      student = JSON.parse(response.body)

      expect(response).to be_success
      expect(student['teacher_id']).to eq(@teacher.id)
    end
  end

  context "update student by student id" do
    it "update a student by id on current_user" do
      headers = {"CONTENT-TYPE" => "application/json"}
      params = {student: {name: "Update Name", username: "Update Username", language: "Spanish", level: 3, pass_img: @student1.pass_img.img}}.to_json

      patch "/api/v1/teachers/students/#{@student2.id}", params: params, headers: headers

      student = JSON.parse(response.body)

      expect(response).to be_success
      expect(student['teacher_id']).to eq(@teacher.id)
      expect(student['id']).to eq(@student2.id)
      expect(student['name']).to eq("Update Name")
      expect(student['username']).to eq("Update Username")
      expect(student['language']).to eq("Spanish")
      expect(student['level']).to eq(3)
      expect(student['img']).to eq("#{@student1.pass_img.img}")
    end
  end

end
