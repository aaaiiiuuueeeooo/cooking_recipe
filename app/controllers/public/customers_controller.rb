class Public::CustomersController < ApplicationController

  def index
    @recipes = current_customer.recipes
  end

  def index_bookmark
    @bookmarks = Bookmark.where(customer_id: current_customer.id)
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(params[:id])
  end

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def customer_params
    params.require(:customer).permit(:screen_name,:email)
  end
end
