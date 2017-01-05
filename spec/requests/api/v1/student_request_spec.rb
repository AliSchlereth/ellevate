require "rails_helper"

describe "student requests by teacher" do
  context "all students by teacher" do
    it "returns an array of students belonging to a teacher" do
      teacher = create(:teacher)
      student1, student2, student3 = create_list(:student, 3, teacher: teacher)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)
      get "/api/v1/teachers/students"

      students = JSON.parse(response.body)
      expect(response).to be_success
      expect(students).to be_an(Array)
      expect(students.count).to eq(3)
      students.each do |student|
        expect(student['teacher_id']).to eq(teacher.id)
        expect(student).to have_key("level")
        expect(student).to have_key("language")
        expect(student).to have_key("username")
        expect(student).to have_key("name")
      end
    end
  end
end
