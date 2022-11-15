class Public::RecipesController < ApplicationController
    def index
        @recipe = Recipe.new
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.find(params[:recipe_id])
        @comment = @recipe.comments.new(comment_params)
        @recipe.customer_id = current_customer.id
        if @recipe.save
            redirect_to request.referer
        else
            @recipe = Recipe.new
            @comments = @recipe.comments
            redirect_to recipes_path
        end
    end



    def show
        @recipe = Recipe.find(params[:id])
        @comment = Comment.new
        @comments = @recipe.comments
    end

    def edit
       @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        @recipe.update(recipe_params)
        redirect_to recipes_path
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to recipes_path
    end

    private

    def recipe_params
        params.require(:recipe).permit(:image,:recipe_name,:introduction)
    end

    def comment_params
        params.require(:recipe).permit(:comment)
    end

end
