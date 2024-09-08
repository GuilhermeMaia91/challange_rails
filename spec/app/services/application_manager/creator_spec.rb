require 'rails_helper'

describe ApplicationManager::Creator do
  let(:instance) { described_class.new }
  let(:block_transaction) { true }
  let(:result) { instance.create(block_transaction) }

  describe '#create' do
    context 'when handle a exception error to create' do
      it 'raises an error' do
        expect { result }.to raise_error(NotImplementedError)
      end
    end

    context 'when implements execute_creation' do
      before do
        allow(instance).to receive(:execute_creation) do
          proc.call
        end
      end

      context 'when using block_transcation eq true' do
        let(:proc) do
          Proc.new do
            create(:country)
            create(:country)
          end
        end

        it 'should be creates all registers' do
          expect { result }.not_to raise_error
          expect(Country.count).to eq(2)
        end
      end

      context 'when does not using block_transcation' do
        let(:block_transaction) { false }
        let(:proc) do
          Proc.new do
            create(:country)
            create(:country)
          end
        end

        it 'should be creates all registers' do
          expect { result }.not_to raise_error
          expect(Country.count).to eq(2)
        end
      end
    end
  end
end