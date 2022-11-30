class Public::RecipesController < ApplicationController
    def index
        @recipe = Recipe.new
        @recipes = Recipe.all
        if params[:tag_ids]
            @recipes = []
            params[:tag_ids].each do |key, value|
                if value == "1"
                    tag_recipes = Tag.find_by(name: key).recipes
                    @recipes = @recipes.empty? ? tag_recipes : @recipes & tag_recipes
                end
            end
        end
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = current_customer.recipes.new(recipe_params)
        if @recipe.save!
            redirect_to recipes_path
        else
            render :new
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

    def keyword_search
        if params[:keyword].present?
            @recipes = Recipe.where('recipe_name LIKE ?', "%#{params[:keyword]}%")
            @keyword = params[:keyword]
        else
            @recipes = Recipe.all
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:image,:recipe_name,:introduction, tag_ids:[])
    end


end
