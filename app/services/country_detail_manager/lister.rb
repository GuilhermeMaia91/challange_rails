module CountryDetailManager
  class Lister < ApplicationManager::Lister

    private

    def filter
      search = CountryDetail.ransack(query)
      search.sorts = ['id desc']
      search.result
    end

    def query
      {
        observation_cont: @filters[:observation],
        country_name_cont: @filters[:name],
      }
    end
  end
end
