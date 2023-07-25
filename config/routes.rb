Rails.application.routes.draw do
  resources :list_items
  resources :lists
  resources :items
  resources :categories
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
