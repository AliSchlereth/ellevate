require "rails_helper"

describe "student visits their content page" do
  xscenario "they see an image of an animal" do
    student = create(:student)
    visit student_path(student)

    expect(page).to have_css("img[src*='pixabay.com/static']")
    expect(page).to have_css("img[src*='pixabay.com/get']")
  end

  scenario "they see a sentence frame and input form" do
    student = create(:student, level: 3)
    create_list(:sentence, 20)
    visit student_path(student)

    expect(page).to have_css('.sentence-frame')
  end
end
