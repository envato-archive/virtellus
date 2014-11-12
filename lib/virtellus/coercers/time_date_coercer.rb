require 'date'

module Virtellus
  module Coercers
    class TimeDateCoercer
      def self.coerce(time, to_type, options)
        CoercionResult.new(::Date.new(time.year, time.month, time.day), false)
      end
    end
  end
end
