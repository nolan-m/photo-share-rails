FactoryGirl.define do
  factory :user do
    user_name Faker::Internet.user_name
    name Faker::Name.name
    password 'password'
    password_confirmation 'password'
  end
end
