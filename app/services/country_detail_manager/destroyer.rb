module CountryDetailManager
  class Destroyer < ApplicationManager::Destroyer

    private

    def execute_delete
      country_detail.delete
    end

    def country_detail
      @country_detail ||= CountryDetail.find(id)
    end
  end
end
