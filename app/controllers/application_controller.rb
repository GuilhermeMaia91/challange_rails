class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from(StandardError) { |e| error!(Exceptions::Base.new, :internal_server_error, nil, e) }
  rescue_from(Exceptions::Base) { |e| error!(e, e.code) }
  rescue_from(ActiveRecord::RecordInvalid) { |e| error!(e, :bad_request, ErrorSerializer::RecordInvalid) }
  rescue_from(ActiveRecord::RecordNotFound) { |e| error!(e, :bad_request, ErrorSerializer::RecordNotFound) }

  def error!(error, code, serializer = nil, original_exception = nil)
    serializer ||= ErrorSerializer::Base
    render json: original_exception.presence || error.presence, status: code, serializer: serializer
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name phone])
  end
end
