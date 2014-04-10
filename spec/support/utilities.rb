def create_user_and_sign_in
  user = FactoryGirl.create :user
  visit new_session_path
  fill_in "User name", with: user.user_name
  fill_in "Password", with: user.password
  save_and_open_page
  click_button "Log In"
end
