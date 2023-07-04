Rails.application.routes.draw do
  devise_for :users
  
  resources :recipes, except: [:edit] do
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end
  
  resources :foods
  resources :users
  
  # Add the route for the edit action
  get 'recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'

  root "foods#index"
end