require "rails_helper"

describe "student requests by teacher" do
  context "all students by teacher" do
    it "returns an array of students belonging to a teacher" do
      teacher = create(:teacher)
      student1, student2, student3 = create_list(:student, 3, teacher: teacher)
      get "/api/v1/teachers/#{teacher.id}/students"

      students = JSON.parse(response.body)

      expect(response).to be_success
      expect(students).to be_an(Array)
      expect(students.count).to eq(3)
      expect(students.include?(student1)).to be_truthy
      expect(students[0]).to be_a(Student)
    end
  end
end
