require 'rails_helper'

describe Users::SessionsController, type: :request do
  let(:user) { create(:user) }
  let(:email_sigin) { user.email }
  let(:password_sigin) { user.password }
  let(:params) { { user: {email: email_sigin, password: password_sigin} } }
  let(:result) { JSON.parse(response.body) }

  before do
    post('/login', params: params)
  end

  describe 'POST login' do
    context 'when the user is successfully authenticated' do
      it 'returns a success response' do
        expect(response).to be_successful
        expect(response.headers['Authorization']).to be_present
      end
    end

    context 'when the user is not successfully authenticated' do
      let(:password_sigin) { '123' }

      it 'returns an error' do
        expect(response.code).to eq("401")
        expect(result.keys).to eq(['tag', 'error'])
        expect(result['tag']).to eq("Unauthenticate")
        expect(result['error']).to eq("Usuário e senha inválido.")
      end
    end
  end
end
