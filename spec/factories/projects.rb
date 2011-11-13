# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name {Faker::Product.product_name}
    association :company
    description {Faker::Lorem.paragraph }
  end
end
