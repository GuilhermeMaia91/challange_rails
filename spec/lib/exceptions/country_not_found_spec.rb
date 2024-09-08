require 'rails_helper'

describe ::Exceptions::CountryNotFound do
  let(:instance) { described_class.new }

  it { expect(instance.code).to eq(:unprocessable_entity) }
  it { expect(instance.message).to eq(I18n.t('errors.messages.country_not_found')) }
end