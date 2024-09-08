require 'rails_helper'

describe ::Exceptions::Base do
  let(:instance) { described_class.new }

  it { expect(instance.code).to eq(:internal_server_error) }
  it { expect(instance.message).to eq(I18n.t('errors.messages.unavailable')) }
end