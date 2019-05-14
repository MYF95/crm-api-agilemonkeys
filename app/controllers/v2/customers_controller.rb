class V2::CustomersController < ApplicationController

  # GET /customers
  def index
    json_response({ message: 'Test v2 API' })
  end
end
