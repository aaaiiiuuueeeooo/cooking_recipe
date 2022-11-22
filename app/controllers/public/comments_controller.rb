class Public::CommentsController < ApplicationController

  def create

    @comment = Comment.new
    @comment.customer_id = current_customer.id
    @comment.recipe_id = params[:comment][:recipe_id]
    @comment.body = params[:comment][:body]
    @comment.save!

    redirect_to request.referer

  end
end
