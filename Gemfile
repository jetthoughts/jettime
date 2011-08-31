source 'http://rubygems.org'

gem 'rails', "3.1.0.rc6"
#gem 'rails', :git => 'git://github.com/rails/rails.git'
# gem 'ruby-debug19', :require => 'ruby-debug'

group :assets do
  #gem 'sass-rails', "  ~> 3.1.0.rc"
  #gem 'coffee-rails', "~> 3.1.0.rc"
  #gem 'uglifier'
end

gem "haml", ">= 3.1.2"
gem "haml-rails", ">= 0.3.4", :group => :development
gem "devise"
gem "jquery-rails"
gem "bson_ext", ">= 1.3.1"
gem "mongoid", ">= 2.1.5"
gem "omniauth", ">= 0.2.6"
#gem "frontend-helpers"

# gem 'inherited_resources', '1.1.2'
# gem 'has_scope'


group :development, :test do
  gem 'web-app-theme', '>= 0.6.2'
  gem 'rspec-rails'
end

group :test do
   gem "capybara"
   gem 'database_cleaner'
   gem 'factory_girl_rails'
   gem 'mongoid-rspec'
end

group :deploy do
   gem 'heroku'
   gem 'thin'
   # Use unicorn as the web server
   # gem 'unicorn'
   # Deploy with Capistrano
   # gem 'capistrano'
end
