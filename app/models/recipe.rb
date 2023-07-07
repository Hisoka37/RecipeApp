class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id', dependent: :destroy

  validates :name, presence: true
  validates :preparation_time, numericality: { only_integer: true, greater_or_equal_to: 0 }
  validates :cooking_time, numericality: { only_integer: true, greater_or_equal_to: 0 }
  validates :description, presence: true
  validates :public, inclusion: { in: [true, false], message: 'should be a boolean value' }

  def all_food_items
    recipe_foods.select(:food_id).distinct.count
  end

  def total_price
    recipe_foods.includes(:food).sum { |recipe_food| recipe_food.food.price * recipe_food.quantity }
  end
end
