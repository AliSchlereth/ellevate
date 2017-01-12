require "rails_helper"

describe "student visits their content page", js: true do
  xscenario "they see an image of an animal" do
    student = create(:student)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(student)
    visit student_path(student)

    expect(page).to have_css("img[src*='pixabay.com/static']")
    expect(page).to have_css("img[src*='pixabay.com/get']")
  end

end

describe "student sees their content page" do
  scenario "they see a sentence frame and input form" do
    student = create(:student, level: 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(student)
    create_list(:sentence, 20)
    visit student_path(student)

    expect(page).to have_css('.sentence-frame')
  end
end
