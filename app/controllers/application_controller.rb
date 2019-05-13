class ApplicationController < ActionController::API
  before_action :authenticate_user!

  include Response
  include ExceptionHandler

  respond_to :json
end
