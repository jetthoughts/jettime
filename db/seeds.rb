# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

company = Company.create!(name: "JetThoughts, LLC", subdomain: "jets")
User.create!(:email => "admin@mailinator.com", :password=>"monkey", :admin => true, company: company)
User.create!(:email => "user@mailinator.com", :password=>"monkey", :admin => false, company: company)
