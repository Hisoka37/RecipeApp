Rails.application.routes.draw do
  devise_for :users
  
  resources :recipes, except: [:edit] do
  resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end
  
  resources :foods
  resources :users
  
  get 'public_recipes/index'
  # Add the route for the edit action
  get 'recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  get '/general_shopping_list' , to: 'users#shopping_list'
  get 'recipes/:recipe_id/new_ingredient' , to: 'recipes#new_ingredient' , as: :new_ingredient
  post 'recipes/:recipe_id/new_ingredient' , to: 'recipes#create_ingredient' , as: :create_ingredient
  root "foods#index"
end