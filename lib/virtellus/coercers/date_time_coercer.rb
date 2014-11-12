module Virtellus
  module Coercers
    class DateTimeCoercer
      def self.coerce(date, to_type, options)
        CoercionResult.new(date.to_time, false)
      end
    end
  end
end
