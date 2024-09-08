require 'rails_helper'

describe ::Pagination, type: :serializer do
  let!(:country) { create(:country) }

  let(:per_page) { nil }
  let(:page) { 1 }
  let(:object) { Country.all.page(page).per(per_page) }
  let(:instance) { described_class.new(object) }
  let(:result) { JSON.parse(instance.to_json) }

  context 'pagination' do
    it 'should be a object pagination' do
      expect(result.keys).to match_array(['current_page', 'next_page', 'per_page', 'prev_page', 'total_count', 'total_pages'])
      expect(result['current_page']).to eq(1)
      expect(result['next_page']).to be_nil
      expect(result['per_page']).to eq(25)
      expect(result['prev_page']).to be_nil
      expect(result['total_count']).to eq(1)
      expect(result['total_pages']).to eq(1)
    end

    context 'when have a multiples objects' do
      let(:country) { create_list(:country, 2).first }

      it 'should be a object pagination' do
        expect(result.keys).to match_array(['current_page', 'next_page', 'per_page', 'prev_page', 'total_count', 'total_pages'])
        expect(result['current_page']).to eq(1)
        expect(result['next_page']).to be_nil
        expect(result['per_page']).to eq(25)
        expect(result['prev_page']).to be_nil
        expect(result['total_count']).to eq(2)
        expect(result['total_pages']).to eq(1)
      end

      context 'when per_page = 1' do
        let(:per_page) { 1 }

        it 'should be a object pagination' do
          expect(result.keys).to match_array(['current_page', 'next_page', 'per_page', 'prev_page', 'total_count', 'total_pages'])
          expect(result['current_page']).to eq(1)
          expect(result['next_page']).to eq(2)
          expect(result['per_page']).to eq(1)
          expect(result['prev_page']).to be_nil
          expect(result['total_count']).to eq(2)
          expect(result['total_pages']).to eq(2)
        end
      end

      context 'when per_page = 2' do
        let(:page) { 2 }

        it 'should be a object pagination' do
          expect(result.keys).to match_array(['current_page', 'next_page', 'per_page', 'prev_page', 'total_count', 'total_pages'])
          expect(result['current_page']).to eq(2)
          expect(result['next_page']).to be_nil
          expect(result['per_page']).to eq(25)
          expect(result['prev_page']).to be_nil
          expect(result['total_count']).to eq(2)
          expect(result['total_pages']).to eq(1)
        end
      end
    end
  end
end