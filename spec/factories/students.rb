FactoryGirl.define do
  factory :student do
    name "MyString"
    username "Username"
    sequence :level, (%w[1 2 3]).cycle do |level|
      level
    end
    language "Spanish"
    teacher
    pass_img
  end
end
