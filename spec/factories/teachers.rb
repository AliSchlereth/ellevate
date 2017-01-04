FactoryGirl.define do
  factory :teacher do
    provider "google"
    uid "#{Random.rand(10)}"
    first_name "First"
    last_name "Last"
    email "first@email.com"
    token "123456789"
    refresh_token "MyString"
    oauth_expires_at "2017-01-03 20:23:04"
  end
end
