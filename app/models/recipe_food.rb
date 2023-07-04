class RecipeFood < ApplicationRecord
  belongs_to :food, foreign_key: :food_id, dependent: :destroy
  belongs_to :recipe, foreign_key: :recipe_id, dependent: :destroy
end
