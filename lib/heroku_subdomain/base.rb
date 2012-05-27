module HerokuSubdomain
  class Base

    attr_accessor :error

    class << self
      attr_accessor :heroku
    end

    def initialize(options=nil)
      if options.is_a?(Array)
        return options.map { |o| self.class.new(o) }
      else
        @options = options && options.symbolize_keys! || {}
        @error = options.delete(:error) if @options.has_key?(:error)
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
      if response.error.blank?
        response.body
      else
        nil
      end
    end

    def wrapper(*attrs)
      self.class.wrapper(*attrs)
    end
  end
end