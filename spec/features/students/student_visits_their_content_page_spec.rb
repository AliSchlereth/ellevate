require "rails_helper"

describe "student visits their content page" do
  scenario "they see an image of an animal" do
    student = create(:student)
    visit student_path(student)

    expect(page).to have_css("img[src*='pixabay']")
  end
end
