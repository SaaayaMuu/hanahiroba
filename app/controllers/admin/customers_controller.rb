class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.order("created_at DESC")
  end


  def show
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.all.order(created_at: :desc)
  end
end
