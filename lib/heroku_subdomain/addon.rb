module HerokuSubdomain
  class Addon < Base

    attr_accessor :name

    def initialize(options=nil)
      super
      @name = @options[:name] if @options && @options.has_key?(:name)
    end

    def self.by_app(app)
      self.new(wrapper(:get_addons, app.name))
    end

    def self.create(name, app)
      return name.map{|n| self.create(n, app)} if name.is_a?(Array)

      self.new(wrapper(:post_addon, app.name, name))
    end
  end
end
