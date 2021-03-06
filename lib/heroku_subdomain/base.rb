module HerokuSubdomain
  class Base

    attr_accessor :error

    class << self
      attr_accessor :heroku, :mock
    end

    def initialize(options=nil)
      @options = options && options.symbolize_keys! || {}
      @error = options.delete(:error) if @options.has_key?(:error)
    end

    def self.new(options=nil)
      if options.is_a?(Array)
        return options.map { |o| self.new(o) }
      else
        super
      end
    end

    def method_missing(meth, *args, &block)
      _method_name = method_name.to_sym
      if @options.has_key? _method_name
        @options[_method_name]
      else
        super
      end
    end

    def self.heroku
      self.to_s == "HerokuSubdomain::Base" ? @heroku : HerokuSubdomain::Base.heroku
    end

    def [](key)
      @options[key]
    end

    def self.wrapper(method_name, *attrs)
      response = heroku.send(method_name, *attrs)

      response.body unless response.respond_to?(:error)
    end

    def wrapper(*attrs)
      self.class.wrapper(*attrs)
    end
  end
end