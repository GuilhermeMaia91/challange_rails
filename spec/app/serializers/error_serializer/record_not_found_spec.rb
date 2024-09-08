require 'rails_helper'

describe ::ErrorSerializer::RecordNotFound, type: :serializer do
  let(:error) { Country.find(0) }
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
      expect(result['tag']).to eq('ActiveRecord::RecordNotFound')
      expect(result['error']).to eq(I18n.t("activerecord.exceptions.not_found"))
      expect(result.keys).to eq(['tag', 'error'])
    end
  end
end