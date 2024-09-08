module CountryManager
  class Updater < ApplicationManager::Updater

    attr_reader :id, :name, :name_short

    def initialize(id, params)
      super(id)
      @name = params[:name]
      @name_short = params[:name_short]
    end

    private

    def execute_update
      country.name = name
      country.name_short = name_short
      country.save!

      country.reload
    end

    def country
      @country ||= Country.find(id)
    end
  end
end
