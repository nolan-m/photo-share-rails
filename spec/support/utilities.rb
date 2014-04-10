def create_user_and_sign_in
  user = FactoryGirl.create :user
  visit new_user_path
  fill_in "User name", with: Faker::Internet.user_name
  fill_in "Name", with: Faker::Name.name
  fill_in "Password", with: user.password
  fill_in "Password confirmation", with: user.password
  @name = user.user_name
  click_button "Sign Up"
end
