module ApplicationManager
  class Updater

    attr_reader :id

    def initialize(id)
      @id = id
    end

    def update
      ActiveRecord::Base.transaction { execute_update }
    end

    private

    def execute_update
      raise NotImplementedError
    end
  end
end
