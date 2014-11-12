module Virtellus
  class AttributeDefinition
    attr_reader :name, :type, :options

    def initialize(name, type, options)
      @name, @type, @options = name, type, options
    end

    def define_accessors(onto_class)
      onto_class.module_eval do
        eval %{def #{name}; @_virtellus_attributes[name]; end}
        eval %{def #{name}=(value); @_virtellus_attributes.set(name, value); end}
      end
    end

    def from_value(value)
      return value if value.is_a?(type)

      if value.nil?
        raise "#{name} - Value required" if options[:required]
        return nil
      end

      result = Virtellus.coerce(value, type, options)

      if result.error?
        raise "#{name} - Invalid type of #{value.class.name} (expected #{type})"
      else
        result.value
      end
    end
  end
end
