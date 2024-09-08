require 'rails_helper'

describe CountryDetailsController, type: :request do
  let!(:country) { create(:country) }
  let(:name) { "Estados Unidos" }
  let(:name_short) { 'USA' }
  let(:country_id) { country.id }
  let(:params) { { name: name, name_short: name_short } }
  let(:user) { create(:user) }
  let(:result) { JSON.parse(response.body) }

  context 'when user is logged in' do
    before do
      sign_in(user)

      put("/countries/#{country_id}", params: params)
    end

    describe 'PATCH country' do
      it 'returns a success response' do
        expect(response).to be_successful
        expect(result.keys).to match_array(['id', 'name', 'name_short'])
        expect(result['name']).to eq(name)
        expect(result['name_short']).to eq(name_short)
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
      put("/countries/#{country_id}", params: params)
    end

    it 'returns an error' do
      expect(response.code).to eq("401")
      expect(result.keys).to eq(['tag', 'error'])
    end
  end
end
