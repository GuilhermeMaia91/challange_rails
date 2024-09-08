require 'rails_helper'

RSpec.describe CountryDetail, type: :model do
  let(:observation) { "País lindo, maravilhoso!" }
  let(:country_detail) { build(:country_detail, observation: observation) }

  it "should be valid with a observation and picture" do
    expect(country_detail).to be_valid
    expect(country_detail.country).to be_instance_of(::Country)
    expect(country_detail.observation).to eq(observation)
    expect(country_detail.picture).to be_present
  end

  context 'when invalid data' do
    let(:observation) { nil }

    it "should be invalid without a observation" do
      expect(country_detail).not_to be_valid
    end
  end
end