module Virtellus
  class AttributeValues
    attr_reader :attributes
    attr_reader :values

    def initialize(attribute_set)
      @attributes = attribute_set
      @values = Hash.new
    end

    def assign(source_hash)
      @values = Hash.new

      (attributes.names & source_hash.keys).each do |key|
        @values[key] = attributes[key].from_value(source_hash[key])
      end
    end
  end
end
