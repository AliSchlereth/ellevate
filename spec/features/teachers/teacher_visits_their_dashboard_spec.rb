require "rails_helper"

describe "teacher visits their dashboard" do
  context "they see all their students " do
    it "all students are listed alphabetically by level" do
      teacher = create(:teacher)
      student1, student2, student3 = create_list(:student, 3, teacher: teacher)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(teacher)
      visit teacher_dashboard_path

      expect(page).to have_content(student1.username)
      expect(page).to have_content(student1.name)
      expect(page).to have_content(student1.language)
      expect(page).to have_content(student1.level)
      expect(page).to have_content(student1.pass_img.img)
      expect(page).to have_content(student2.username)
      expect(page).to have_content(student3.username)
    end
  end
end
