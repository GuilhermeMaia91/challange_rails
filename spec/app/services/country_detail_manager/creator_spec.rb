require 'rails_helper'

describe CountryDetailManager::Creator do
  let(:country_detail) { build(:country_detail) }
  let(:country) { create(:country) }
  let(:country_id) { country.id }
  let(:instance) { described_class.new(country_id, country_detail.observation, country_detail.picture) }
  let(:result) { instance.create }

  describe '#create' do
    context 'when handle a exception error to create' do
      context 'when country already exist' do
        let(:country_id) { nil }

        it 'raises an error' do
          expect { result }.to raise_error(Exceptions::CountryNotFound)
        end
      end

      context 'when observation is invalid' do
        let(:country_detail) { build(:country_detail, observation: nil) }

        it 'raises an error' do
          expect { result }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end

    context 'when creates with success' do
      it 'should be create a country' do
        expect { result }.not_to raise_error
        expect(result.observation).to eq(country_detail.observation)
        expect(result.picture).to eq(country_detail.picture)
      end
    end
  end
end