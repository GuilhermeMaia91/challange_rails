module ErrorSerializer
  class RecordNotFound < ErrorSerializer::Base
    attribute(:error) { I18n.t('activerecord.exceptions.not_found') }
  end
end
