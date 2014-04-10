require 'spec_helper'


describe User do
  context 'create' do
    it 'lets a new user create a profile' do
      visit pictures_path
      click_link 'New User'
      fill_in 'User name', :with => 'test_man'
      fill_in 'Name', :with => 'Josh Test'
      fill_in 'Password', :with => 'testpass'
      fill_in 'Password confirmation', :with => 'testpass'
      click_button 'Sign Up'
      page.should have_content 'Thank you for signing up'
    end
  end


end
