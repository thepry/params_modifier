require 'params_modifier/version'
require 'params_modifier/base'

# Base module file for ParamsModifier gem
module ParamsModifier
end

module ActionController
  # Add filter method to ActionController::Parameters
  class Parameters
    def filter(params_modifier)
      params_modifier.new(self).call
    end
  end
end
