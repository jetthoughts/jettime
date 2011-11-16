source 'http://rubygems.org'

gem 'bundler', '1.1.rc'
gem 'rails', "~> 3.1"
#gem 'rails', :git => 'git://github.com/rails/rails.git'
#gem 'ruby-debug19', :require => 'ruby-debug'

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
gem "bson_ext", ">= 1.3.1"
gem "mongoid", ">= 2.1.5"
gem 'oa-openid', :require => 'omniauth/openid'
gem "airbrake"
gem "will_paginate", "~> 2"
#gem "frontend-helpers"
#gem 'has_scope'

group :development, :test do
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'web-app-theme' #, :git => 'git://github.com/pilu/web-app-theme.git'
  gem "rspec-rails", "2.8.0.rc1"
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'foreman', :require => false
  gem 'guard-spork', :require => false
  gem 'guard-bundler', :require => false
  gem 'guard-rspec', :require => false
  gem 'spork', :require => false
  gem 'growl'
  gem 'rspec'
end

group :production do
  gem 'dalli'
  gem 'newrelic_rpm'
end

group :test do
  gem 'therubyracer'
  gem "capybara"
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'mongoid-rspec'
  gem 'mocha'
  gem 'ffaker'
end

group :deploy do
  gem 'heroku'
  gem 'thin'
end
