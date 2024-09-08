require 'rails_helper'

describe CountryDetailsController, type: :request do
  let(:country_detail) { create(:country_detail) }
  let(:params) { { name: country_detail.country.name, observation: country_detail.observation } }
  let(:user) { create(:user) }
  let(:result) { JSON.parse(response.body) }

  context 'when user is logged in' do
    before do
      sign_in(user)

      get('/country_details', params: params)
    end

    describe 'GET country details' do
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
