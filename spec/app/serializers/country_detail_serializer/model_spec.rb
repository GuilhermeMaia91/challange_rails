require 'rails_helper'

describe ::CountryDetailSerializer::Model, type: :serializer do
  let(:country_detail) { create(:country_detail) }
  let(:instance) { described_class.new(country_detail) }
  let(:result) { JSON.parse(instance.to_json) }

  context 'country' do
    it 'should be a JSON' do
      result
      expect(result['id']).to eq(country_detail.id)
      expect(result['country']['id']).to eq(country_detail.country.id)
      expect(result['observation']).to eq(country_detail.observation)
      expect(result['picture']).to eq(country_detail.picture)
    end
  end
end