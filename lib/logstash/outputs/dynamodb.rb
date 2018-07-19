# encoding: utf-8
# frozen_string_literal: true

require 'logstash/outputs/base'
require 'logstash/namespace'
require 'aws-sdk'

module LogStash
  module Outputs
    class Dynamodb < LogStash::Outputs::Base
      config_name 'dynamodb'

      config :aws_access_key_id,     validate: :string, required: true
      config :aws_secret_access_key, validate: :string, required: true
      config :table_name,            validate: :string, required: true
      config :create_table,          validate: :boolean, default: false
      config :region,                validate: :string, default: 'us-east-1'
      config :primary_key,           required: false
      config :sort_key,              required: false
      config :read_capacity_units,   validate: :number, default: 5
      config :write_capacity_units,  validate: :number, default: 5

      public

      def register
        Aws.config[:credentials] = Aws::Credentials.new(@aws_access_key_id, @aws_secret_access_key)
        Aws.config[:region] = @region

        @dynamodb_client = Aws::DynamoDB::Client.new
      end

      public

      def receive(_event)
        'Event received'
      end
    end
  end
end
