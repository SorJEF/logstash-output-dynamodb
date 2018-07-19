# frozen_string_literal: true

require 'logstash/devutils/rspec/spec_helper'
require 'logstash/codecs/plain'
require 'logstash/event'
require 'rspec'
require 'dotenv/load'
require 'webmock'
require 'climate_control'
require 'simplecov'

WebMock.disable_net_connect!(allow: %w[localhost 127.0.0.1])

require_relative 'support'

RSpec.configure do |config|
  config.include(SpecHelpers::Env)
end
