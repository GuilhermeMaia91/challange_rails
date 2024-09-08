require 'rails_helper'

describe ::ErrorSerializer::RecordInvalid, type: :serializer do
  let(:error) { Country.create! }
  let(:error_instance) do
    begin
      error
    rescue StandardError => e
      e
    end
  end
  let(:instance) { described_class.new(error_instance) }
  let(:result) { JSON.parse(instance.to_json) }

  context 'error' do
    it 'should be a JSON' do
      result
      expect(result['tag']).to eq('ActiveRecord::RecordInvalid')
      expect(result['error']).to eq("Informações inválidas: Name não pode ser vazio, Name short não pode ser vazio")
      expect(result.keys).to eq(['tag', 'error', 'fields', 'errors'])
    end
  end
end