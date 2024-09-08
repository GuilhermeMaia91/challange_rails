module ApplicationManager
  class Creator
    def create(block_transaction = true)
      if block_transaction
        ActiveRecord::Base.transaction { execute_creation }
      else
        execute_creation
      end
    end

    private

    def execute_creation
      raise NotImplementedError
    end
  end
end
