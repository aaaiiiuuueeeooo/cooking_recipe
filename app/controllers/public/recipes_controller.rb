class Public::RecipesController < ApplicationController
    def index
        @recipe = Recipe.new
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.save
        redirect_to recipes_path
    end

    private

    def recipe_params
        params.require(:recipe).permit(:image,:recipe_name,:introduction)
    end
end
