require 'rails_helper'

describe CountryManager::Updater do
  let!(:country) { create(:country) }
  let(:name) { "Estados Unidos" }
  let(:name_short) { 'USA' }
  let(:country_id) { country.id }
  let(:params) { { name: name, name_short: name_short } }
  let(:instance) { described_class.new(country_id, params) }
  let(:result) { instance.update }

  describe '#update' do
    context 'when handle a exception error to create' do
      context 'when country does not exist' do
        let!(:country_id) { 99999 }

        it 'raises an error' do
          expect { result }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end

      context 'when name is invalid' do
        let(:name) { nil }

        it 'raises an error' do
          expect { result }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end

    context 'when updates with success' do
      it 'should be update a country' do
        expect { result }.not_to raise_error
        expect(result.name).to eq(name)
        expect(result.name_short).to eq(name_short)
      end
    end
  end
end