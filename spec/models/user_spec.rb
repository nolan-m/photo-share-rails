require 'spec_helper'

describe User do
  it { should have_secure_password }
  it { should validate_presence_of :name }
  it { should validate_presence_of :user_name }
  it { should have_many :pictures}
  it { should have_many :tags }
  it "should be validate uniq of email " do
    user = User.new(:user_name => 'test@test.com', :name =>
    'mac', :password => 'test', :password_confirmation => 'test')
    user.save
    expect(user).to validate_uniqueness_of :user_name
  end

end
