class Public::CustomersController < ApplicationController

  def index
    @recipes = current_customer.recipes
    
  end
end
