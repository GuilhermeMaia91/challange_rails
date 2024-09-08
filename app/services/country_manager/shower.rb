module CountryManager
  class Shower < ApplicationManager::Shower

    private

    def instance
      Country.find(id)
    end
  end
end
