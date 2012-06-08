require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However, 
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rails'
  require 'capybara/dsl'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  RSpec.configure do |config|
    config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    # config.mock_with :rspec

    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    config.before(:each, type: :request) do
      Capybara.configure do |config|
        config.server_port    = 9293
        config.default_host   = 'http://lvh.me:9293'
        config.app_host       = 'http://lvh.me:9293'
      end

      host! 'lvh.me:9293'
    end

    config.infer_base_class_for_anonymous_controllers = false
    config.filter_run :focus => true
    config.run_all_when_everything_filtered                = true
    config.treat_symbols_as_metadata_keys_with_true_values = true

    config.include Factory::Syntax::Methods
    #config.include Devise::TestHelpers#, :type => [:controller, :requests]
    #config.extend ControllerMacros#, :type => [:controller, :requests]
    #config.include(Capybara, :type => :integration)
  end

end

Spork.each_run do
  # This code will be run each time you run your specs.
  FactoryGirl.reload
  ActiveSupport::Dependencies.clear

  DatabaseCleaner.strategy = :truncation

  HerokuSubdomain::App.any_instance.stubs(:update_repo).returns(nil)
end

# --- Instructions ---
# - Sort through your spec_helper file. Place as much environment loading 
#   code that you don't normally modify during development in the 
#   Spork.prefork block.
# - Place the rest under Spork.each_run block
# - Any code that is left outside of the blocks will be ran during preforking
#   and during each_run!
# - These instructions should self-destruct in 10 seconds.  If they don't,
#   feel free to delete them.
#

