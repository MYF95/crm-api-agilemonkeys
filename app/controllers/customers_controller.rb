class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]

  # GET /customers
  def index
    @customers = Customer.all
    json_response(@customers)
  end

  # POST /customers
  def create
    @customer = Customer.create!(customer_params)
    attach_avatar
    json_response(@customer, :created)
  end

  # GET /customers/:id
  def show
    customer = { profile_picture: url_for(@customer.avatar), record: @customer }
    json_response(customer)
  end

  # PUT /customers/:id
  def update
    @customer.update(customer_params)
    head :no_content
  end

  # DELETE /customers/:id
  def destroy
    @customer.destroy
    head :no_content
  end

  private

  def customer_params
    params.permit(:name, :surname, :created_by, :updated_by, :avatar)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def attach_avatar
    avatar = params[:avatar].presence || {io: File.open("#{Rails.root}/public/images/default_avatar.png"), filename: 'default_avatar'}
    @customer.avatar.attach(avatar)
  end
end
