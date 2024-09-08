require 'rails_helper'

describe Users::RegistrationsController, type: :request do
  let(:params) { { user: {name: 'User Test', email: 'user_test@gmail.com', phone: '11999999999', password: 'test123456'} } }
  let(:result) { JSON.parse(response.body) }

  before do
    post('/signup', params: params)
  end

  describe 'POST signup' do
    context 'when user is registred with success' do
      it 'returns a success response' do
        expect(response).to be_successful and \
                            change(User, :count).from(0).to(1)
      end
    end

    context 'when user is not registred' do
      let(:params) { {} }

      it 'returns an error' do
        expect(response.code).to eq("422")
        expect(result.keys).to eq(['status'])
        expect(result['status']['message']).to eq("#{I18n.t('errors.messages.user_not_registered')} Name não pode ser vazio, Email não pode ser vazio, Email não pode ser vazio, and Password não pode ser vazio")
      end
    end
  end
end
