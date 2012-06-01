module HerokuSubdomain
  class Provider

    attr_reader :heroku

    def initialize(options={})
      @heroku = options[:heroku]
      @addons = (options[:addons] || []).reject(&:blank?)
      @vars   = options[:vars] || {}
      @mock   = @heroku.instance_variable_get("@connection").connection[:mock]
      HerokuSubdomain::Base.heroku = @heroku
      HerokuSubdomain::Base.mock = @heroku.instance_variable_get("@connection").connection[:mock]
    end

    def create(app_name)
      app = App.create(app_name)
      app.addons(@addons)
      app.vars(@vars)
      app.update_repo
    end

    def update(app_name)
      response = @heroku.get_app(app_name)
      app = case response.status
            when 202, 200
              HerokuSubdomain::App.new(response.body)
            else
              nil
            end
      app.update_repo
    end

    def update_vars
      @heroku.put_config_vars(name, HEROKU_API_KEY: ENV['HEROKU_API_KEY']) if ENV['HEROKU_API_KEY']
    end

  end

end
