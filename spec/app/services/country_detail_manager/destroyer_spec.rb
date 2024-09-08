require 'rails_helper'

describe CountryDetailManager::Destroyer do
  let(:country_detail) { create(:country_detail) }
  let(:country_detail_id) { country_detail.id }
  let(:instance) { described_class.new(country_detail_id) }
  let(:result) { instance.delete }

  describe '#delete' do
    context 'when handle a exception error to delete' do
      context 'when country detail does not exist' do
        let!(:country_detail_id) { 99999 }

        it 'raises an error' do
          expect { result }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end

    context 'when delete with success' do
      it 'should be delete a country detail' do
        expect(result).to eq(country_detail)
      end
    end
  end
end