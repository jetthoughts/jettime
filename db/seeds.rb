# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_company = Company.create!(name: "JetThoughts, LLC", subdomain: Rails.application.config.admin_subdomain)
User.create!(email: "admin@mailinator.com", password: "monkey", admin: true, company: admin_company)

jets_company = Company.create!(name: "JetThoughts, LLC", subdomain: "jets")
User.create!(email: "jets@mailinator.com", password: "monkey", company: jets_company)
