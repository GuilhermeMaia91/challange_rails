require 'rails_helper'

describe CountriesController, type: :request do
  let!(:country) { create(:country) }
  let(:country_id) { country.id }
  let(:user) { create(:user) }
  let(:result) { JSON.parse(response.body) }

  context 'when user is logged in' do
    before do
      sign_in(user)

      delete("/countries/#{country_id}")
    end

    describe 'DELETE country' do
      it 'returns a success response' do
        expect(response).to be_successful
        expect(result.keys).to match_array(['id', 'name', 'name_short'])
      end

      context 'when send params does not exist' do
        let(:country_id) { 99999 }

        it 'returns an error' do
          expect(response.code).to eq("400")
          expect(result.keys).to eq(["tag", "error"])
        end
      end
    end
  end

  context 'when user is not logged in' do
    before do
      delete("/countries/#{country_id}")
    end

    it 'returns an error' do
      expect(response.code).to eq("401")
      expect(result.keys).to eq(['tag', 'error'])
    end
  end
end
