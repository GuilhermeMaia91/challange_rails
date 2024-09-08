require 'rails_helper'

describe CountryDetailsController, type: :request do
  let!(:country_detail) { create(:country_detail) }
  let(:country_detail_id) { country_detail.id }
  let(:user) { create(:user) }
  let(:result) { JSON.parse(response.body) }

  context 'when user is logged in' do
    before do
      sign_in(user)

      delete("/country_details/#{country_detail_id}")
    end

    describe 'DELETE country' do
      it 'returns a success response' do
        expect(response).to be_successful
        expect(result.keys).to match_array(['id', 'observation', 'picture', 'country'])
      end

      context 'when send params does not exist' do
        let(:country_detail_id) { 99999 }

        it 'returns an error' do
          expect(response.code).to eq("400")
          expect(result.keys).to eq(["tag", "error"])
        end
      end
    end
  end

  context 'when user is not logged in' do
    before do
      delete("/country_details/#{country_detail_id}")
    end

    it 'returns an error' do
      expect(response.code).to eq("401")
      expect(result.keys).to eq(['tag', 'error'])
    end
  end
end
