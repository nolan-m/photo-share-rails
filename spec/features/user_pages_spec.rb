require 'spec_helper'

feature "user has a profile page" do
  scenario "user accesses profile page via nav bar link" do
    create_user_and_sign_in
    click_link "View Profile"
    page.should have_content "Your tagged pictures:"
  end
end
