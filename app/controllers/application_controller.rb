class ApplicationController < ActionController::API
  before_action :authenticate_user!

  include Response
  include ExceptionHandler

  respond_to :json

  private

  def authenticate_admin
    unless current_user.admin?
      error = 'You do not have permissions to perform that action'
      json_response(error, 401)
    end
  end
end