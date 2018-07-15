# encoding: utf-8
# frozen_string_literal: true

require 'logstash/outputs/base'
require 'logstash/namespace'
require 'aws-sdk-dynamodb'

module LogStash
  module Outputs
    class Dynamodb < LogStash::Outputs::Base
      config_name 'dynamodb'

      config :region,                validate: :string, default: 'us-east-1'
      config :aws_access_key_id,     validate: :string
      config :aws_secret_access_key, validate: :string
      config :table_name,            validate: :string, required: true
      config :table_attributes,      validate: :array,  required: false

      public

      def register; end

      public

      def receive(_event)
        'Event received'
      end
    end
  end
end
