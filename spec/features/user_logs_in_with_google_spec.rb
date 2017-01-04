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

    })
end
