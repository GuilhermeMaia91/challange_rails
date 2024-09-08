module CountryManager
  class Destroyer < ApplicationManager::Destroyer

    private

    def execute_delete
      country.delete
    end

    def country
      @country ||= Country.find(id)
    end
  end
end
