class AddDetailToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :comment, :text
  end
end
