module CountryManager
  class Lister < ApplicationManager::Lister

    private

    def filter
      search = Country.ransack(query)
      search.sorts = ['id desc']
      search.result
    end

    def query
      {
        name_cont: @filters[:name],
        name_short_eq: @filters[:name_short]
      }
    end
  end
end
