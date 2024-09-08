module CountryDetailManager
  class Updater < ApplicationManager::Updater

    attr_reader :id, :observation, :picture

    def initialize(id, params)
      super(id)
      @observation = params[:observation]
      @picture = params[:picture]
    end

    private

    def execute_update
      country_detail.observation = observation
      country_detail.picture = picture
      country_detail.save!

      country_detail.reload
    end

    def country_detail
      @country_detail ||= CountryDetail.find(id)
    end
  end
end
