# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
      subdomain { Faker::Internet.domain_word }
      custom_domain { Faker::Internet.domain_name }
      name { Faker::Company.name }
    end
end