module CountrySerializer
  class ListResource < ActiveModel::Serializer
    type 'collection'

    attribute :pagination

    def pagination
      ::Pagination.new(object)
    end

    has_many(:data, serializer: ::CountrySerializer::Model) { object }
  end
end
