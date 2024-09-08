module CountryManager
  class Creator < ApplicationManager::Creator
    attr_reader :name, :name_short

    def initialize(name, name_short)
      @name = name
      @name_short = name_short
    end

    def execute_creation
      validate!

      Country.create!(name: name, name_short: name_short)
    end

    private

    def validate!
      country = Country.find_by(name: name, name_short: name_short)
      raise Exceptions::CountryAlreadyExist if country.present?
    end
  end
end
