Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :meetups, only: [ :new, :create, :show, :edit, :update, :destroy ]
  # Defines the root path route ("/")
  # root "articles#index"
end
