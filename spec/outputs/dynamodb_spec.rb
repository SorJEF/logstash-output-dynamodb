# frozen_string_literal: true

require 'logstash/outputs/dynamodb'

RSpec.describe LogStash::Outputs::Dynamodb do
  describe 'configuration' do
    context 'is valid' do
      it 'includes table_name, aws_access_key_id and aws_secret_access_key' do
        config = {
          'table_name'            => 'Music',
          'aws_secret_access_key' => 'key',
          'aws_access_key_id'     => 'id'
        }

        output = described_class.new(config)

        expect(output.table_name).to eq config['table_name']
        expect(output.aws_secret_access_key).to eq config['aws_secret_access_key']
        expect(output.aws_access_key_id).to eq config['aws_access_key_id']
      end
    end

    context 'is invalid' do
      it 'does not include table_name' do
        config = { 'primary_key' => 'Artist' }

        expect {
          described_class.new(config)
        }.to raise_error(LogStash::ConfigurationError)
      end
    end

    context 'credentials' do
      it 'sets aws credentials' do
        key = 'key'
        id  = 'id'

        config = {
          'table_name'            => 'Music',
          'aws_secret_access_key' => key,
          'aws_access_key_id'     => id
        }

        output = described_class.new(config)

        output.register

        expect(output.aws_access_key_id).to eq id
        expect(output.aws_secret_access_key).to eq key
        expect(Aws.config[:region]).to eq 'us-east-1'
        expect(Aws.config[:credentials].access_key_id).to eq id
      end
    end

    context 'defaults' do
      it 'sets default for aws region' do
        expected_region = 'us-east-1'

        config = {
          'table_name'            => 'Music',
          'aws_secret_access_key' => 'key',
          'aws_access_key_id'     => 'id'
        }

        output = described_class.new(config)

        expect(output.region).to eq expected_region
        expect(Aws.config[:region]).to eq expected_region
      end
    end
  end

  describe 'receive message' do
    config = {
      'table_name'            => 'Test',
      'aws_access_key_id'     => 'id',
      'aws_secret_access_key' => 'key'
    }

    event  = LogStash::Event.new
    output = described_class.new(config)

    output.register

    subject { output.receive(event) }

    it 'returns a string' do
      expect(subject).to eq('Event received')
    end
  end
end
