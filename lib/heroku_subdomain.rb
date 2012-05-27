require 'heroku-api'
require 'heroku_subdomain/base'
require 'heroku_subdomain/app'
require 'heroku_subdomain/addon'
require 'heroku_subdomain/provider'
require 'heroku_subdomain/configuration'

module HerokuSubdomain

  class << self

    attr_accessor :provider

    def configure(&block)
      yield(configuration)
      self.provider = Provider.new(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end

end

HerokuSubdomain.configure do |config|
  config.heroku_api_key = '197c9196f0c294ceea9c8720b7dc5772' || ENV['HEROKU_API_KEY']
  config.addons = [""]
end