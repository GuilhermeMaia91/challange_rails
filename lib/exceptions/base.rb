module Exceptions
  class Base < StandardError
    CODE = :internal_server_error
    MESSAGE = 'errors.messages.unavailable'.freeze

    def initialize(options = {})
      @options = options
    end

    def message
      I18n.t(self.class::MESSAGE, **@options)
    end

    def code
      self.class::CODE
    end
  end
end
