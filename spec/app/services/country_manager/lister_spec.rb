require 'rails_helper'

describe CountryManager::Lister do
  let!(:country) { create(:country) }
  let(:filters) { {} }
  let(:instance) { described_class.new(nil, nil, filters) }
  let(:result) { instance.build }

  describe '#build' do
    context 'when returns country' do
      it 'should be returns' do
        expect(result.count).to eq(1)
        expect(result.first).to eq(country)
      end
    end

    context 'filtering' do
      context 'by name' do
        let(:name_filter) { country.name }
        let(:filters) { {name: name_filter} }

        it { expect(result.count).to eq(1) }

        context 'when not found' do
          let(:name_filter) { 'test' }

          it { expect(result.count).to be_zero }
        end
      end

      context 'by name_short' do
        let(:name_short_filter) { country.name_short }
        let(:filters) { {name_short: name_short_filter} }

        it { expect(result.count).to eq(1) }

        context 'when not found' do
          let(:name_short_filter) { 'test' }

          it { expect(result.count).to be_zero }
        end
      end
    end
  end
end