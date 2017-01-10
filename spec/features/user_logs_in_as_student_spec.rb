require "rails_helper"

describe "user logs in as a student" do
  scenario "they link from welcome page" do
    teacher = create(:teacher)
    pass_img = PassImg.create(img: "glyphicon glyphicon-book")
    student = create(:student, teacher: teacher, pass_img: pass_img)
    create_list(:sentence, 20, level: student.level)

    visit root_path
    within('.student-panel') do
      click_link "Sign In"
    end

    expect(current_path).to eq(student_login_path)

    fill_in "Teacher", with: teacher.last_name
    fill_in "Username", with: student.username
    page.first(".glyphicon-book").click
    # within('.book') do
    #   click_on
    # end
    expect(page).to have_content("Type your sentence below:")
    expect(page).to have_content("#{student.name}")
  end
end
