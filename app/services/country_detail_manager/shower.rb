module CountryDetailManager
  class Shower < ApplicationManager::Shower

    private

    def instance
      CountryDetail.find(id)
    end
  end
end
