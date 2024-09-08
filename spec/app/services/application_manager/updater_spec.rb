require 'rails_helper'

describe ApplicationManager::Updater do
  let(:object) { create(:country) }
  let(:id) { object.id }
  let(:instance) { described_class.new(id) }
  let(:result) { instance.update }

  describe '#build' do
    context 'when handle a exception error to call build' do
      it 'raises an error' do
        expect { result }.to raise_error(NotImplementedError)
      end
    end

    context 'when update with success' do
      let(:object_updated) { object.update!(name: "Russia") }

      before { allow(instance).to receive(:execute_update).and_return(object_updated) }

      it 'should be updated name of object' do
        expect(result).to be_truthy
        expect(object.reload.name).to eq("Russia")
      end
    end
  end
end