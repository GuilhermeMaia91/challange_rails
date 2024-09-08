require 'rails_helper'

describe CountriesController, type: :request do
  let(:params) { {name: 'Russia', name_short: 'RU'} }
  let(:user) { create(:user) }
  let(:result) { JSON.parse(response.body) }

  context 'when user is logged in' do
    before do
      sign_in(user)

      post('/countries', params: params)
    end

    describe 'POST country' do
      it 'returns a success response' do
        expect(response).to be_successful
      end

      context 'when send params invalid' do
        let(:params) { {} }

        it 'returns an error' do
          expect(response.code).to eq("400")
          expect(result.keys).to eq(["tag", "error", "fields", "errors"])
        end
      end
    end
  end

  context 'when user is not logged in' do
    before do
      post('/countries', params: params)
    end

    it 'returns an error' do
      expect(response.code).to eq("401")
      expect(result.keys).to eq(['tag', 'error'])
    end
  end
end
