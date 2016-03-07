module ParamsModifier
  # Base class for params modifier
  class Base
    def self.parameter(param_name, &block)
      define_method "_parameter_#{param_name}".to_sym, &block
    end

    def initialize(attributes)
      @attributes = attributes
    end

    def call
      @attributes.each do |key, value|
        method_name = "_parameter_#{key}"
        @attributes[key] = send(method_name, value) if respond_to?(method_name)
      end
    end
  end
end
