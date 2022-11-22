class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customers = Customer.all
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customers_path
  end

  
  
  private

  def customer_params
    params.require(:customer).permit(:email,:screen_name)
  end
end
