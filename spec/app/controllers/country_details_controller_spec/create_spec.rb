require 'rails_helper'

describe CountryDetailsController, type: :request do
  let(:country) { create(:country, name: 'Russia', name_short: 'RU') }
  let(:params) { {country_id: country.id, observation: 'Russia é bela no inverno', picture: 'https://russia_inverno.com.ru'} }
  let(:user) { create(:user) }
  let(:result) { JSON.parse(response.body) }

  context 'when user is logged in' do
    before do
      sign_in(user)

      post('/country_details', params: params)
    end

    describe 'POST country details' do
      it 'returns a success response' do
        expect(response).to be_successful
      end

      context 'when send params invalid' do
        let(:params) { {} }

        it 'returns an error' do
          expect(response.code).to eq("422")
          expect(result.keys).to eq(["tag", "error"])
        end
      end
    end
  end

  context 'when user is not logged in' do
    before do
      post('/country_details', params: params)
    end

    it 'returns an error' do
      expect(response.code).to eq("401")
      expect(result.keys).to eq(['tag', 'error'])
    end
  end
end
