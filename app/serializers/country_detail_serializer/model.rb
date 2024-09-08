module CountryDetailSerializer
  class Model < ActiveModel::Serializer
    attributes :id, :observation, :picture, :country

    def country
      CountrySerializer::Model.new(object.country)
    end
  end
end
