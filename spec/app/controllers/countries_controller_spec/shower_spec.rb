require 'rails_helper'

describe CountriesController, type: :request do
  let(:country) { create(:country) }
  let(:id) { country.id }
  let(:user) { create(:user) }
  let(:result) { JSON.parse(response.body) }

  context 'when user is logged in' do
    before do
      sign_in(user)

      get("/countries/#{id}")
    end

    describe 'GET country' do
      it 'returns a success response' do
        expect(response).to be_successful
        expect(result.keys).to match_array(["id", "name", "name_short"])
      end

      context 'when not found data' do
        let(:id) { 99999 }

        it 'returns an error' do
          expect(response.code).to eq("400")
          expect(result.keys).to match_array(["tag", "error"])
          expect(result['tag']).to eq("ActiveRecord::RecordNotFound")
          expect(result['error']).to eq("Registro não encontrado.")
        end
      end
    end
  end

  context 'when user is not logged in' do
    before do
      get("/countries/#{id}")
    end

    it 'returns an error' do
      expect(response.code).to eq("401")
      expect(result.keys).to eq(['tag', 'error'])
    end
  end
end
