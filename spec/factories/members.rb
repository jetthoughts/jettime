FactoryGirl.define do
  factory :member do
    association :user
    association :project
  end
end