module Exceptions
  class CountryAlreadyExist < Base
    CODE = :unprocessable_entity
    MESSAGE = 'errors.messages.country_already_exist'.freeze
  end
end
