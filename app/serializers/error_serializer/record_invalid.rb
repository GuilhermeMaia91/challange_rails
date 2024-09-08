module ErrorSerializer
  class RecordInvalid < ErrorSerializer::Base
    attribute(:fields) { object.record.errors.details }
    attribute(:errors) { object.record.errors.messages }
  end
end
