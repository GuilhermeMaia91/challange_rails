module CountrySerializer
  class Model < ActiveModel::Serializer
    attributes :id, :name, :name_short
  end
end
