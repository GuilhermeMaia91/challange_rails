require 'rails_helper'

describe ::ErrorSerializer::Base, type: :serializer do
  let(:message) { "Testing handling error message" }
  let(:error) { StandardError.new(message) }
  let(:instance) { described_class.new(error) }
  let(:result) { JSON.parse(instance.to_json) }

  context 'error' do
    it 'should be a JSON' do
      result
      expect(result['tag']).to eq('StandardError')
      expect(result['error']).to eq(message)
      expect(result.keys).to eq(['tag', 'error'])
    end
  end
end