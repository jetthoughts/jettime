FactoryGirl.define do
  factory :user do
    email { Faker::Internet.free_email }
    password "monkey"
    password_confirmation "monkey"

    company
  end
end
