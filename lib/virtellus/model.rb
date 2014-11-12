require_relative 'attribute_set'

module Virtellus
  module Model

    def self.included(base)
      base.send(:extend, ClassMethods)
      base.send(:include, InstanceMethods)
      base.instance_variable_set("@_virtellus_attribute_definitions", Virtellus::AttributeSet.new)
    end

    module ClassMethods

      def attribute(name, type, options = {})
        @_virtellus_attribute_definitions.add(name, type, options).define_accessors(self)
      end

      def attributes
        @_virtellus_attribute_definitions
      end

    end

    module InstanceMethods
      def initialize(values = {})
        assign_attributes(values)
      end

      def assign_attributes(values)
        @_attributes ||= self.class.attributes.assignable
        @_attributes.assign(values)
      end
    end

  end
end
