source 'http://rubygems.org'

gem 'bundler', '1.1.1'
gem 'rails', "~> 3.2"

group :assets do
  gem 'sass-rails', "  ~> 3.1"
  gem 'coffee-rails', "~> 3.1"
  gem 'uglifier'
end

gem "haml", ">= 3.1.2"
gem "haml-rails", ">= 0.3.4", :group => :development
gem "devise"
gem 'devise_invitable'
gem "jquery-rails"
gem "bson_ext", ">= 1.5.1"
gem 'mongoid', :git => "git://github.com/mongoid/mongoid.git"
gem 'omniauth-openid'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem "airbrake"
gem "will_paginate", "~> 2"

group :development, :test do
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'web-app-theme' #, :git => 'git://github.com/pilu/web-app-theme.git'
  gem "rspec-rails",        :git => "git://github.com/rspec/rspec-rails.git"
  gem "rspec",              :git => "git://github.com/rspec/rspec.git"
  gem "rspec-core",         :git => "git://github.com/rspec/rspec-core.git"
  gem "rspec-expectations", :git => "git://github.com/rspec/rspec-expectations.git"
  gem "rspec-mocks",        :git => "git://github.com/rspec/rspec-mocks.git"
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'foreman', :require => false
  gem 'guard-spork', :require => false
  gem 'guard-bundler', :require => false
  gem 'guard-rspec', :require => false
  gem 'spork', :require => false
  gem 'growl'
end

group :production do
  gem 'dalli'
  gem 'newrelic_rpm'
end

group :test do
  gem "capybara"
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  #gem 'mongoid-rspec', require: 'mongoid/rspec'
  gem 'mocha'
  gem 'ffaker', '>= 1.10.1'
end

group :deploy do
  gem 'heroku'
  gem 'heroku-api'
  gem 'thin'
end
