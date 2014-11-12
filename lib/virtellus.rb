require_relative 'virtellus/model'
require_relative 'virtellus/coercer'

module Virtellus
  def self.model
    Virtellus::Model
  end

  class << self
    attr_accessor :coercer
  end

  self.coercer = CoercerMapping.default

  def self.coerce(value, type, options)
    coercer.coerce(value, type, options)
  end
end
