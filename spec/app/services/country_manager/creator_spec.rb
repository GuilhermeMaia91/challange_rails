require 'rails_helper'

describe CountryManager::Creator do
  let(:name) { "Estados Unidos" }
  let(:name_short) { 'USA' }
  let(:instance) { described_class.new(name, name_short) }
  let(:result) { instance.create }

  describe '#create' do
    context 'when handle a exception error to create' do
      context 'when country already exist' do
        let!(:object) { create(:country, name: name, name_short: name_short) }

        it 'raises an error' do
          expect { result }.to raise_error(Exceptions::CountryAlreadyExist)
        end
      end

      context 'when name is invalid' do
        let(:name) { nil }

        it 'raises an error' do
          expect { result }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end

    context 'when creates with success' do
      it 'should be create a country' do
        expect { result }.not_to raise_error
        expect(result.name).to eq(name)
        expect(result.name_short).to eq(name_short)
      end
    end
  end
end