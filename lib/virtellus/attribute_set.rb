require_relative 'attribute_definition'
require_relative 'attribute_values'

module Virtellus
  class AttributeSet
    def initialize
      @attributes = {}
    end

    def add(name, type, options)
      definition = AttributeDefinition.new(name, type, options)
      @attributes[name] = definition
      definition
    end

    def names
      @attributes.keys
    end

    def [](name)
      @attributes[name]
    end

    def assignable
      AttributeValues.new(self)
    end
  end
end
