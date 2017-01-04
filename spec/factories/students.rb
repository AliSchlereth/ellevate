FactoryGirl.define do
  factory :student do
    name "MyString"
    username "MyString"
    sequence :level, (%w[1 2 3]).cycle do |level|
      level
    end
    language "MyString"
    teacher
    pass_img
  end
end
