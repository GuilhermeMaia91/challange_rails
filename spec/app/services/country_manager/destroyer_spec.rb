require 'rails_helper'

describe CountryManager::Destroyer do
  let(:country) { create(:country) }
  let(:country_id) { country.id }
  let(:instance) { described_class.new(country_id) }
  let(:result) { instance.delete }

  describe '#delete' do
    context 'when handle a exception error to delete' do
      context 'when country does not exist' do
        let!(:country_id) { 99999 }

        it 'raises an error' do
          expect { result }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end

    context 'when delete with success' do
      it 'should be delete a country' do
        expect(result).to eq(country)
      end
    end
  end
end