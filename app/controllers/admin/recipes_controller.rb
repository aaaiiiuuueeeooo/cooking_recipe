class Admin::RecipesController < ApplicationController
  
    def index
        @recipe = Recipe.new
        @recipes = Recipe.all
    end
    
    def show
        @recipe = Recipe.find(params[:id])
        @comment = Comment.new
        @comments = @recipe.comments
    end
    
    def keyword_search
        if params[:keyword].present?
            @recipes = Recipe.where('recipe_name LIKE ?', "%#{params[:keyword]}%")
            @keyword = params[:keyword]
        else
            @recipes = Recipe.all
        end
    end
end
