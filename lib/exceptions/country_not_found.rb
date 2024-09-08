module Exceptions
  class CountryNotFound < Base
    CODE = :unprocessable_entity
    MESSAGE = 'errors.messages.country_not_found'.freeze
  end
end
