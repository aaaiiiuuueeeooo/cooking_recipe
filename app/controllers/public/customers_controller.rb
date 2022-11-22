class Public::CustomersController < ApplicationController

  def index
    @recipes = current_customer.recipes
  end

  def index_bookmark
    @bookmarks = Bookmark.where(customer_id: current_customer.id)
  end

end
