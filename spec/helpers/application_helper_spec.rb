require "rails_helper"

xdescribe "ApplicationHelper" do
  context "current_students" do
    it "returns an array of students by level belonging to current user" do
      teacher = create(:teacher)
      student1, student2, student3, student4 = create_list(:student, 4, teacher: teacher)
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)
      # allow_any_instance_of(ApplicationHelper).to receive(:current_user).and_return(teacher)
      include ApplicationHelper
      students = ApplicationHelper.current_students

      expect(students).to be_a(Array)
      expect(students[0].level).to be < students[-1]
    end
  end
end
