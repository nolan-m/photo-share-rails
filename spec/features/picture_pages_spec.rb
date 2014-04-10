require 'spec_helper'



feature "User signs in" do
  scenario 'with a valid user name and password' do
    create_user_and_sign_in
    visit new_picture_path
    attach_file("Click the button to choose a picture to upload:", File.expand_path("./app/assets/images/spacecat.png"))
    fill_in "caption", with: "whatever!"
    click_button 'Create Picture'
    page.should have_xpath("//img[@alt='Spacecat']")
  end
end


