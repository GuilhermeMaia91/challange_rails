module CountryDetailManager
  class Creator < ApplicationManager::Creator
    attr_reader :country_id, :observation, :picture

    def initialize(country_id, observation, picture)
      @country_id = country_id
      @observation = observation
      @picture = picture
    end

    def execute_creation
      CountryDetail.create!(country: country, observation: observation, picture: picture)
    end

    private

    def country
      begin
        @country = Country.find(country_id)
      rescue ActiveRecord::RecordNotFound
        raise Exceptions::CountryNotFound
      end
    end
  end
end
