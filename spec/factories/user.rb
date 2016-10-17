FactoryGirl.define do
  factory :user do
    name "Test User"
    email "user123@gmail.com"
    password "please123"
    password_confirmation "please123"
  end
end
