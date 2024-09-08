require 'rails_helper'

RSpec.describe User, type: :model do
  let(:name) { "Teste 123" }
  let(:user) { build(:user, name: name) }

  it "should be valid with a name and email" do
    expect(user).to be_valid
  end

  context 'when invalid data' do
    let(:name) { nil }

    it "should be invalid without a name" do
      expect(user).not_to be_valid
    end
  end
end