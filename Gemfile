source 'http://rubygems.org'

gem 'bundler', '>= 1.2.0.pre'
gem 'rails', "~> 3.2"
gem 'unicorn'
gem 'heroku'
gem 'heroku-api'

group :assets do
  gem 'sass-rails', "  ~> 3.1"
  gem 'coffee-rails', "~> 3.1"
  gem 'uglifier'
end

# View
gem "haml", ">= 3.1.2"
gem "haml-rails", ">= 0.3.4", :group => :development

gem "jquery-rails"
gem "bson_ext", ">= 1.5.1"

#Database
                             #TODO: Add note, why we use mongoid from github
gem 'mongoid', "~> 3.0.0.rc" #, :git => "git://github.com/mongoid/mongoid.git"

# Authentication/authorization
gem 'devise'
gem 'devise_invitable'
gem 'devise-encryptable'


gem 'omniauth-openid'
gem 'omniauth'
gem 'omniauth-google-oauth2'

# Helpers
gem "airbrake"
gem "will_paginate", "~> 2"

group :development, :test do
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'web-app-theme' #, :git => 'git://github.com/pilu/web-app-theme.git'

  #TODO: Why we use rspec from github
  gem 'rspec-rails', '>= 2.10.0'
  gem 'rspec', '>= 2.10.0'
  #,        :git => "git://github.com/rspec/rspec-rails.git"

  gem 'guard-spork', require: false
  gem 'guard-bundler', require: false
  gem 'guard-rspec', require: false

  gem 'growl'
  gem 'rb-inotify', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-fchange', require: false

  gem 'spork', require: false

  gem 'foreman', require: false
end

group :production do
  gem 'dalli'
  gem 'newrelic_rpm'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'

  gem 'factory_girl', '~> 2.6.0'
  gem 'factory_girl_rails'

  #gem 'mongoid-rspec', require: 'mongoid/rspec'

  gem 'mocha'
  gem 'ffaker', '>= 1.10.1'
end
