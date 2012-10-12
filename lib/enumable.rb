require "enumable/version"

module Enumable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    # TODO support default values

    def has_enumable_attribute(attribute, types)
      # getter
      define_method attribute do
        types.invert[read_attribute(attribute)]
      end

      # setter
      define_method "#{attribute}=" do |value|
        unless value.is_a? Fixnum
          value = value.to_sym
          raise "Undefined #{attribute}: #{value}" unless types[value]
          value = types[value]
        end
        write_attribute(attribute, value)
      end

      define_singleton_method(attribute) do |value|
        where(attribute => types[value])
      end
    end
  end
end

ActiveRecord::Base.class_eval do
  include Enumable
end