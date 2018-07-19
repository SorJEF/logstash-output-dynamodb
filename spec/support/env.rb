# frozen_string_literal: true

require 'climate_control'

module SpecHelpers
  module Env
    def with_modified_env(options, &block)
      ClimateControl.modify(options, &block)
    end
  end
end
