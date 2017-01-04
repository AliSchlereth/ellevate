require "rails_helper"

describe "user logs in with Google" do
  scenario "they link to google authorization" do
    stub_omniauth
    visit root_path
    click_link "Sign in with Google"
    expect(page).to have_content("First Last")
    expect(page).to have_link("Log Out")
  end
end


def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
     provider: "google",
     uid: "12345678910",
     info: {
       email: "first@email.com",
       first_name: "First",
       last_name: "Last"
     },
     credentials: {
       token: "abcdefg12345",
       refresh_token: "12345abcdefg",
       expires_at: DateTime.now,
     }
   })
end
