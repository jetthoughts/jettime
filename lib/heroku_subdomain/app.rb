require 'heroku_subdomain/git'
require 'heroku_subdomain/base'

module HerokuSubdomain
  class App < Base

    attr_accessor :name, :git_url

    def initialize(options=nil)
      super
      @name, @git_url = @options.delete(:name), @options.delete(:git_url)
    end

    def self.create(name)
      self.new wrapper(:post_app, {name: name, stack: "cedar"})
    end

    def self.get_app(name)
      self.new wrapper(:get_app, name)
    end

    def update_repo
      Git.init_directory unless Git.git_directory?
      Git.add_remote name, git_url unless Git.remotes.include?(name)
      Git.push name
    end

    def clone(new_name)
      app = self.class.create(new_name)
      app.addons(self.addons_names)
      app.vars(self.vars)
    end

    def addons_names
      Addon.by_app(self).map(&:name)
    end

    def addons(val=nil)
      if val.nil?
        Addon.by_app(self)
      else
        Addon.create(val, self) if val.any?
      end
    end

    def vars(val={})
      if val.blank?
        self.class.heroku.get_config_vars(name).body
      else
        vars.each do |key, val|
          self.class.heroku.put_config_vars(name, {key => val})
        end
      end
    end

  end
end