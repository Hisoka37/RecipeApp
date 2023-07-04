Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:new, :create, :index, :show, :destroy, :put] do
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end
  resources :foods
  resources :users

  root "foods#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end


