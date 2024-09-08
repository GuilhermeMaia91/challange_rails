require 'rails_helper'

describe CountryDetailManager::Lister do
  let!(:country_detail) { create(:country_detail) }
  let(:filters) { {} }
  let(:instance) { described_class.new(nil, nil, filters) }
  let(:result) { instance.build }

  describe '#build' do
    context 'when returns country' do
      it 'should be returns' do
        expect(result.count).to eq(1)
        expect(result.first).to eq(country_detail)
      end
    end

    context 'filtering' do
      context 'by observation' do
        let(:observation_filter) { country_detail.observation }
        let(:filters) { {observation: observation_filter} }

        it { expect(result.count).to eq(1) }

        context 'when not found' do
          let(:observation_filter) { 'test' }

          it { expect(result.count).to be_zero }
        end
      end

      context 'by country name' do
        let(:country_name_filter) { country_detail.country.name }
        let(:filters) { {name: country_name_filter} }

        it { expect(result.count).to eq(1) }

        context 'when not found' do
          let(:country_name_filter) { 'test' }

          it { expect(result.count).to be_zero }
        end
      end
    end
  end
end