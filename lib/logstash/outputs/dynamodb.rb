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
      config :region,                validate: :string, default: 'us-east-1'
      config :table_name,            validate: :string, required: true
      config :fields,                validate: :array,  required: true

      public

      def register
        Aws.config[:credentials] = Aws::Credentials.new(@aws_access_key_id, @aws_secret_access_key)
        Aws.config[:region] = @region

        @dynamodb = Aws::DynamoDB::Client.new
      end

      public

      def receive(_event)
        message = Hash.new

        @fields.each do |x|
          if _event.get(x)
            message[x] = _event.get(x)
          end
        end

        @dynamodb.put_item(:table_name => @table_name, :item => message)
      end
    end
  end
end
