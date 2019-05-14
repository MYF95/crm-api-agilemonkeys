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
    @customer.update_attribute(:created_by, current_user.id)
    attach_avatar
    json_response(@customer, :created)
  end

  # GET /customers/:id
  def show
    customer = { avatar: url_for(@customer.avatar), record: @customer }
    json_response(customer)
  end

  # PUT /customers/:id
  def update
    @customer.update!(customer_params)
    attach_avatar if params[:avatar].present?
    json_response('Customer updated', 200)
  end

  # DELETE /customers/:id
  def destroy
    @customer.destroy!
    json_response( 'Customer deleted from the database', 200)
  end

  private

  def customer_params
    params.permit(:name, :surname, :avatar).merge(updated_by: current_user.id)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def attach_avatar
    avatar = params[:avatar].presence || {io: File.open("#{Rails.root}/public/images/default_avatar.png"), filename: 'default_avatar'}
    @customer.avatar.attach(avatar)
  end
end