require 'rails_helper'

describe ApplicationManager::Shower do
  let(:object) { create(:country) }
  let(:id) { object.id }
  let(:instance) { described_class.new(id) }
  let(:result) { instance.build }

  describe '#build' do
    context 'when handle a exception error to call build' do
      it 'raises an error' do
        expect { result }.to raise_error(NotImplementedError)
      end
    end

    context 'when found with success' do
      before { allow(instance).to receive(:build).and_return(object) }

      it 'should be a Country object' do
        expect(result).to be_instance_of(Country)
        expect(result.id).to be_present
        expect(result.name).to be_present
      end
    end
  end
end