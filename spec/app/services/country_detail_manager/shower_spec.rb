require 'rails_helper'

describe CountryDetailManager::Shower do
  let!(:country_detail) { create(:country_detail) }
  let(:id) { country_detail.id }
  let(:instance) { described_class.new(id) }
  let(:result) { instance.build }

  describe '#build' do
    context 'when returns a country_detail' do
      it 'should be returns' do
        expect(result).to be_instance_of(CountryDetail)
        expect(result.id).to eq(country_detail.id)
      end
    end

    context 'when id does not exist' do
      let(:id) { 999999 }

      it { expect{ result } .to raise_error(ActiveRecord::RecordNotFound) }
    end

    context 'when id nil' do
      let(:id) { nil }

      it { expect{ result }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end