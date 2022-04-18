Rails.application.routes.draw do
  devise_for :users

  resources :recipes, only: [:index, :show, :create, :new, :destroy] do
    resources :recipe_foods, only: [:new, :destroy]
  end
  
  resources :recipe_foods, only: [:index, :edit, :update, :destroy, :create, :new]
  
  resources :public_recipes, only: %i[index]

  get 'shopping_list', to: 'shopping_list#index'

  root to: 'foods#index'
  resources :foods, only: [:index, :create, :new, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do 
    authenticated :user do 
      root 'users#index', as: :authenticated_root 
    end
    unauthenticated do 
      root 'devise/sessions#new', as: :unauthenticated_root 
    end 
  end

  # Defines the root path route ("/")
end
