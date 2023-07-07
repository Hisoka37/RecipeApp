class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).where(public: true).order(created_at: :desc)
    @users = User.includes(:recipes).where(recipes: { public: true })
  end
end
