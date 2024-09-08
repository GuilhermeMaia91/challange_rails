require 'rails_helper'

RSpec.describe Country, type: :model do
  let(:name) { "Teste 123" }
  let(:country) { build(:country, name: name) }

  it "should be valid with a name and name_short" do
    expect(country).to be_valid
    expect(country.name).to eq(name)
    expect(country.name_short).to be_present
  end

  context 'when invalid data' do
    let(:name) { nil }

    it "should be invalid without a name" do
      expect(country).not_to be_valid
    end
  end
end