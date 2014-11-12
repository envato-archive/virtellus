require_relative 'coercers/time_date_coercer'
require_relative 'coercers/date_time_coercer'

module Virtellus
  class CoercionResult < Struct.new(:value, :error)
    def error?
      error
    end
  end

  class CoercerMapping

    class NoCoercerFoundError < StandardError
      def initialize(from, to)
        @from, @to = from, to
        super("No coersion found from #{from} to #{to}")
      end
    end

    def initialize
      @mapping = Hash.new { |h, k| h[k] = Hash.new }
    end

    def add(from, to, handler)
      @mapping[to][from] = handler
    end

    def coerce(value, to_type, options)
      return CoercionResult.new(value, false) if value.is_a?(to_type)

      coercer = options[:coercer] || @mapping[to_type][value.class] || @mapping[to_type]["*"] || @mapping["*"][to_type] || @mapping["*"]["*"]

      if coercer
        coercer.coerce(value, to_type, options)
      else
        raise NoCoercerFoundError.new(value.class, to_type)
      end
    end

    def self.default
      new.tap do |c|
        c.add Time, Date, Coercers::TimeDateCoercer
        c.add Date, Time, Coercers::DateTimeCoercer
      end
    end

  end
end
