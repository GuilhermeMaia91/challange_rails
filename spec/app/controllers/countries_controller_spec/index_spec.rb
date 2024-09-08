require 'rails_helper'

describe CountriesController, type: :request do
  let(:country) { create(:country) }
  let(:params) { { name: country.name, name_short: country.name_short } }
  let(:user) { create(:user) }
  let(:result) { JSON.parse(response.body) }

  context 'when user is logged in' do
    before do
      sign_in(user)

      get('/countries', params: params)
    end

    describe 'GET country' do
      it 'returns a success response' do
        expect(response).to be_successful
        expect(result.keys).to match_array(['data', 'pagination'])
      end

      context 'when not found data' do
        let(:params) { {name: 'test'} }

        it 'returns an error' do
          expect(response.code).to eq("200")
          expect(result.keys).to match_array(["data", "pagination",])
          expect(result['data']).to eq([])
        end
      end
    end
  end

  context 'when user is not logged in' do
    before do
      get('/countries', params: params)
    end

    it 'returns an error' do
      expect(response.code).to eq("401")
      expect(result.keys).to eq(['tag', 'error'])
    end
  end
end
