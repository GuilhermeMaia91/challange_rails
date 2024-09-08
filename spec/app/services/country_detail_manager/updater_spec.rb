require 'rails_helper'

describe CountryDetailManager::Updater do
  let!(:country_detail) { create(:country_detail) }
  let(:observation) { "Info paraiso" }
  let(:picture) { 'https://picture2.com.br' }
  let(:country_detail_id) { country_detail.id }
  let(:params) { { observation: observation, picture: picture } }
  let(:instance) { described_class.new(country_detail_id, params) }
  let(:result) { instance.update }

  describe '#update' do
    context 'when handle a exception error to create' do
      context 'when country_detail_id does not exist' do
        let!(:country_detail_id) { 99999 }

        it 'raises an error' do
          expect { result }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end

      context 'when observation is invalid' do
        let(:observation) { nil }

        it 'raises an error' do
          expect { result }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end

    context 'when updates with success' do
      it 'should be update a country_detail' do
        expect { result }.not_to raise_error
        expect(result.observation).to eq(observation)
        expect(result.picture).to eq(picture)
      end
    end
  end
end