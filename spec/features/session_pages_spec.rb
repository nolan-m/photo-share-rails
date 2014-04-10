require 'spec_helper'


feature "User signs in" do
  scenario 'with a valid user name and password' do
    create_user_and_sign_in
    page.should have_content 'Logged in as test_man'
  end
end

feature ""
