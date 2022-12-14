class Public::BookmarksController < ApplicationController
  before_action :authenticate_customer!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    bookmark = @recipe.bookmarks.new(customer_id: current_customer.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end


  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    bookmark = @recipe.bookmarks.find_by(customer_id: current_customer.id)
    if bookmark.present?
      bookmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

end
