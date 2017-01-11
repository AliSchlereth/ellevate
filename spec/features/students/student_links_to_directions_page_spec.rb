require "rails_helper"

describe "student links to directions page" do
  scenario "they link to directions" do
    student = create(:student)
    create_list(:sentence, 20, level: student.level)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(student)

    visit student_path(student)
    page.first('.glyphicon-question-sign').click
    # click_on "?"

    expect(current_path).to eq(students_info_path)
    expect(page).to have_content("Directions")
  end
end
