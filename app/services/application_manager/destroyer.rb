module ApplicationManager
  class Destroyer

    attr_reader :id

    def initialize(id)
      @id = id
    end

    def delete
      execute_delete
    end

    private

    def execute_delete
      raise NotImplementedError
    end
  end
end
