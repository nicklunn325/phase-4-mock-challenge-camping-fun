class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  private
  def record_not_found(error)
    render json: {error: error.message}, status: :not_found
  end

  def invalid_record(e)
    render json: {errors: e.record.errors.full_messages}, status: 422
  end

end
