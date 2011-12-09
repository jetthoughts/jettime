# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :timesheet do
    association :project
    association :task
    association :user
    hours 1.5
    date "2011-12-11"
    notes "My Text"
  end
end
