# frozen_string_literal: true

require 'logstash/outputs/dynamodb'

RSpec.describe LogStash::Outputs::Dynamodb do
  let(:config_options) do
    {
      'table_name' => 'testTable'
    }
  end

  let(:sample_event) { LogStash::Event.new }
  let(:output) { LogStash::Outputs::Dynamodb.new(config_options) }

  before do
    output.register
  end

  describe 'receive message' do
    subject { output.receive(sample_event) }

    it 'returns a string' do
      expect(subject).to eq('Event received')
    end
  end
end
