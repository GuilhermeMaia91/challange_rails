require 'rails_helper'

describe ::CountryDetailSerializer::ListResource, type: :serializer do
  let!(:country_detail) { create(:country_detail) }
  let(:instance) { described_class.new(CountryDetail.all.page(1).per(20)) }
  let(:result) { JSON.parse(instance.to_json) }

  context 'country' do
    it 'should be a array data' do
      expect(result.keys).to match_array(['data', 'pagination'])
      expect(result['pagination'].keys).to match_array(['current_page', 'next_page', 'per_page', 'prev_page', 'total_count', 'total_pages'])
    end
  end
end