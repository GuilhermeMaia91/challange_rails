require 'rails_helper'

describe ::CountrySerializer::Model, type: :serializer do
  let(:country) { create(:country, name: "Brasil", name_short: "BR") }
  let(:instance) { described_class.new(country) }
  let(:result) { JSON.parse(instance.to_json) }

  context 'country' do
    it 'should be a JSON' do
      result
      expect(result['id']).to eq(country.id)
      expect(result['name']).to eq(country.name)
      expect(result['name_short']).to eq(country.name_short)
    end
  end
end