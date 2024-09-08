require 'rails_helper'

describe ApplicationManager::Destroyer do
  let(:object) { create(:country) }
  let(:id) { object.id }
  let(:instance) { described_class.new(id) }
  let(:result) { instance.delete }

  describe '#delete' do
    context 'when handle a exception error to call delete' do
      it 'raises an error' do
        expect { result }.to raise_error(NotImplementedError)
      end
    end

    context 'when delete with success' do
      let(:object_delete) { object.delete }

      before { allow(instance).to receive(:execute_delete).and_return(object_delete) }

      it 'should be updated name of object' do
        expect(result).to eq(object)
      end
    end
  end
end