require 'rails_helper'

describe ApplicationManager::Lister do
  let(:page) { nil }
  let(:per_page) { nil }
  let(:filters) { {} }
  let(:instance) { described_class.new(page, per_page, filters) }
  let(:result) { instance.build }

  describe '#build' do
    context 'when handle a exception error to call build' do
      it 'raises an error' do
        expect { result }.to raise_error(NotImplementedError)
      end
    end

    context 'when list with success' do
      let(:page) { 1 }
      let(:per_page) { 20 }
      let!(:countries) { create_list(:country, 3) }
      let(:collection) { Country.all }

      before { allow(instance).to receive(:filter).and_return(collection) }

      it 'should be list all registers' do
        expect { result }.not_to raise_error
        expect(result.current_page).to eq(1)
        expect(result.total_pages).to eq(1)
        expect(result.limit_value).to eq(20)
        expect(result.next_page).to be_nil
        expect(result.prev_page).to be_nil
        expect(result.total_count).to eq(3)
      end

      context 'when have a per_page' do
        let(:per_page) { 1 }

        it 'should be list one register per page' do
          expect { result }.not_to raise_error
          expect(result.current_page).to eq(1)
          expect(result.total_pages).to eq(3)
          expect(result.limit_value).to eq(1)
          expect(result.next_page).to eq(2)
          expect(result.prev_page).to be_nil
          expect(result.total_count).to eq(3)
        end

        context 'when is page 2' do
          let(:page) { 2 }

          it 'should be list page two' do
            expect { result }.not_to raise_error
            expect(result.current_page).to eq(2)
            expect(result.total_pages).to eq(3)
            expect(result.limit_value).to eq(1)
            expect(result.next_page).to eq(3)
            expect(result.prev_page).to eq(1)
            expect(result.total_count).to eq(3)
          end
        end

        context 'when is page 3' do
          let(:page) { 3 }

          it 'should be list page two' do
            expect { result }.not_to raise_error
            expect(result.current_page).to eq(3)
            expect(result.total_pages).to eq(3)
            expect(result.limit_value).to eq(1)
            expect(result.next_page).to be_nil
            expect(result.prev_page).to eq(2)
            expect(result.total_count).to eq(3)
          end
        end

        context 'when is page 4' do
          let(:page) { 4 }

          it 'should be list page two' do
            expect { result }.not_to raise_error
            expect(result.out_of_range?).to be_truthy
            expect(result.total_pages).to eq(3)
            expect(result.limit_value).to eq(1)
            expect(result.next_page).to be_nil
            expect(result.prev_page).to be_nil
            expect(result.count).to be_zero
          end
        end
      end
    end
  end
end