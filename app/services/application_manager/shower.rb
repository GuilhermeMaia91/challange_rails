module ApplicationManager
  class Shower

    attr_reader :id

    def initialize(id)
      @id = id
    end

    def build
      instance
    end

    private

    def instance
      raise NotImplementedError
    end
  end
end
