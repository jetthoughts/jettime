module HerokuSubdomain
  class Configuration

    OPTIONS = [:heroku_api_key, :heroku, :heroku_api, :addons, :vars].freeze

    # The API key for your project, found on the project edit form.
    attr_accessor :heroku, :addons, :vars

    def initialize
      @heroku = nil
    end

    def heroku_api_key=(val)
      @heroku ||= Heroku::API.new(api_key: val)
    end

    def heroku_api=(val)
      @heroku ||= val
    end

    def heroku_api
      @heroku
    end

    def [](option)
      send(option)
    end

    def to_hash
      OPTIONS.inject({}) do |hash, option|
        hash.merge(option.to_sym => send(option))
      end
    end
  end

end